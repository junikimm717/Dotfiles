#!/bin/bash

acpi | awk '/Charging/{print " " $4} /Discharging/{print " " $4} /Unknown/{print "? "}' | sed "s/\,//g"
