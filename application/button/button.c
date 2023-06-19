#include <gpiod.h>
#include <error.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <sys/time.h>

/*********************************
  GPIO45:WIFI Button trigger
  GPIO44:BT Button trigger
  GPIO1 :RF button trigger
  GPIO11:RST button trigger
**********************************/

#define GPIO_RF 1
#define GPIO_WIFI 45
#define GPIO_BT 44
#define GPIO_RESET 11

#define RF_HOOK_EXEC "/usr/share/phoenix/peripheral/button/button_rf.sh"
#define WIFI_HOOK_EXEC "/usr/share/phoenix/peripheral/button/button_wifi.sh"
#define BT_HOOK_EXEC "/usr/share/phoenix/peripheral/button/button_bt.sh"
#define RST_HOOK_EXEC "/usr/share/phoenix/peripheral/button/button_rst.sh"

#define msleep(x) usleep((x)*1000)

struct gpiod_chip *chip;
struct gpiod_line_bulk lines;
struct gpiod_line_bulk events;

unsigned char led_state_flag[3] = {0,0,0};

void trig_state_hook(unsigned int offset)
{
  char command[100];
  unsigned char index = 0;

  switch(offset)
  {
    case GPIO_RF:
      strcpy(command, RF_HOOK_EXEC);
      index = 0;
      printf("RF button is pressed\n");
      break;
    case GPIO_WIFI:
      strcpy(command, WIFI_HOOK_EXEC);
      index = 1;
      printf("WIFI button is pressed\n");
      break;
    case GPIO_BT:
      strcpy(command, BT_HOOK_EXEC);
      index = 2;
      printf("BT button is pressed\n");
      break;
    case GPIO_RESET:
      strcpy(command, RST_HOOK_EXEC);
      index = 3;
      printf("RESET button is pressed\n");
      break;
    default:
      break;
  }

  if(index < 3)
  {
    if(led_state_flag[index]++ % 2 == 0)
    {
      strcat(command, " on");
    }
    else
    {
      strcat(command, " off");
    }
  }

  system(command);
}

int main(int argc, char *argv[])
{
    unsigned int offsets[4];
    int values[4] = {-1,-1,-1,-1};
    int err = 0;
    struct timespec *timeout=NULL;

    // use pin as input
    offsets[0] = GPIO_RF;
    offsets[1] = GPIO_WIFI;
    offsets[2] = GPIO_BT;
    offsets[3] = GPIO_RESET;

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
      err = gpiod_chip_get_lines(chip, offsets, 4, &lines);
      if(err)
      {
        perror("gpiod_chip_get_lines");
        goto cleanup;
      }

      err = gpiod_line_request_bulk_rising_edge_events(&lines, "rising edge example");
      if(err)
      {
        perror("gpiod_line_request_bulk_rising_edge_events");
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
        //printf("%s is triggered \n", gpiod_line_name(line));
        unsigned int offset = gpiod_line_offset(line);
        trig_state_hook(offset);
      }

      cleanup:
        gpiod_line_release_bulk(&lines);
        gpiod_chip_close(chip);
    }

    return err;
}