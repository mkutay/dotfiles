#!/bin/bash

clang -Wall -v temp_sensor.m -framework IOKit -framework Foundation -o temp_sensor
