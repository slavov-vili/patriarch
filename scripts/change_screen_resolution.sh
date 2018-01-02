#!/bin/bash

# A simple script, that prints a menu, where the user can choose a screen resolution

# Get a list of all possible screen resolutions
RESOLUTIONS=$(xrandr | grep -Eo "[0-9]+x[0-9]+[[:space:]]+")
# Save the old reslution just in case
OLD_RES=$(xrandr | grep -E "[0-9]+x[0-9].*\*" | grep -Eo "[0-9]+x[0-9]+")

while true; do
  echo ""
  echo "Select your Screen Resolution"
  # Loop 2 (resolution select)
  select ans in $RESOLUTIONS EXIT;
  do
    case "$ans" in
  
      # if EXIT was selected
      "EXIT")
      # exit the main menu
      break 2
      ;;
  
      # if anything else was selected, try to change the resolution
      *)
      xrandr --output LVDS1 --mode $ans
      # Loop 3 (confirmation)
      echo "Keep $ans resolution ?"
      select yn in Yes No;
      do
        case "$yn" in
  
        # if Yes was selected
        "Yes")
	# exit the main menu
        break 3
        ;;
  
        # if No was selected, keep old resolution
        "No")
        xrandr --output LVDS1 --mode $OLD_RES
	# show the main menu again
        continue 3
        ;;
        esac
      done
      # end select (confirmation)
      ;;
    esac
  done
  # end select (resolution)
done
# end while

