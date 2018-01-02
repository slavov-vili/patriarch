#!/bin/bash

# A simple script, that toggles between languages and sends a notification

# get the current language
CUR_LANG=$(setxkbmap -query | grep layout | grep -o '\b[a-z][a-z]\b')

# match the current language
case "$CUR_LANG" in

  # in case of US
  "us")
  setxkbmap -layout 'bg(bas_phonetic)'
  notify-send "Language switched to Bulgarian !"
  ;;

  # in case of BG
  "bg")
  setxkbmap -layout 'us(basic_us_de)'
  notify-send "Language switched to English !"
  ;;
esac


# Alternatively:
# setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,bg -variant ,bas_phonetic
# Disadvantage: can't print stuff
