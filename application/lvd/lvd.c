#include <gpiod.h>
#include <error.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/time.h>

/*********************************
  GPIO8:Low voltage detect
**********************************/

#define GPIO_LVD 8

#define LVD_HOOK_EXEC "/usr/share/phoenix/peripheral/lvd/lvd.sh"

#define msleep(x) usleep((x)*1000)

struct gpiod_chip *chip;
struct gpiod_line_bulk lines;
struct gpiod_line_bulk events;

void trig_state_hook(unsigned int offset)
{
  char command[100];

  switch(offset)
  {
    case GPIO_LVD:
      strcpy(command, LVD_HOOK_EXEC);
      printf("Low voltage\n");
      break;

    default:
      break;
  }

  system(command);
}

int main(int argc, char *argv[])
{
    unsigned int offsets[1];
    int values[1] = {-1};
    int err = 0;
    struct timespec *timeout=NULL;

    // use pin as input
    offsets[0] = GPIO_LVD;

    while(1)
    {
      msleep(10);
      chip = gpiod_chip_open("/dev/gpiochip0");
      if(!chip)
      {
        perror("gpiod_chip_open");
        err = -1;
        goto cleanup;
      }

      gpiod_line_bulk_init(&lines);
      err = gpiod_chip_get_lines(chip, offsets, 1, &lines);
      if(err)
      {
        perror("gpiod_chip_get_lines");
        goto cleanup;
      }

      err = gpiod_line_request_bulk_falling_edge_events(&lines, "falling edge example");
      if(err)
      {
        perror("gpiod_line_request_bulk_falling_edge_events");
        goto cleanup;
      }

      err = gpiod_line_event_wait_bulk(&lines, timeout, &events);
      if(err == -1)
      {
        perror("gpiod_line_event_wait_bulk");
        goto cleanup;
      }
      else if(err == 0)
      {
        fprintf(stderr, "wait timed out\n");
        goto cleanup;
      }

      err = gpiod_line_get_value_bulk(&events, values);
      if(err)
      {
        perror("gpiod_line_get_value_bulk");
        goto cleanup;
      }

      for(int i=0; i<gpiod_line_bulk_num_lines(&events); i++)
      {
        struct gpiod_line* line;
        line = gpiod_line_bulk_get_line(&events, i);
        if(!line)
        {
          fprintf(stderr, "unable to get line %d\n", i);
          continue;
        }

        unsigned int offset = gpiod_line_offset(line);
        trig_state_hook(offset);
      }

      cleanup:
        gpiod_line_release_bulk(&lines);
        gpiod_chip_close(chip);
    }

    return err;
}