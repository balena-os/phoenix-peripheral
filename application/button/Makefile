# Makefile for button test
# Copyright (c) EDATEC

CC=gcc
CFLAGS=-Wall -std=gnu99 -g
LDFLAGS=-lgpiod

all: button

button: button.c
	$(CC) button.c -o button $(CFLAGS) $(LDFLAGS)

clean:
	rm -rf button