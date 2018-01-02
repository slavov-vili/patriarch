#!/bin/bash

# A very random script, that creates a menu and lets the user change the desktop background using feh

# Loop 1 (the main menu)
while true; do
  echo ""
  echo "Select your folder"
  # Loop 2 (the dir select)
  select dir in $@ EXIT;
    do
      case "$dir" in
      
      # if "exit" was selected
      "EXIT")
      echo "Exiting ..."
      # exit the main menu
      break 3
      ;;

      # if one of the directories was chosen
      *)
      echo "Select your Background"
      # Loop 3 (the file select)
      # select a file from that directory
      select file in $(ls $dir) BACK;
        do
          case "$file" in
      
          # if "back" is chosen
          "BACK")
          # show the directory select menu
          continue 3
          ;;
      
          # if any of the files is chosen
	  *)
	  # add a slash to the path if there isn't any
	  if [[ "$dir" != */ ]]
	  then
	    dir="$dir/"
	  fi
	  echo "View picture ?"
	  #Loop 4 (The view confirmation choice)
	  select yn in Yes No;
	    do
	      case "$yn" in
	      
	      "Yes")
	      # see the file
	      feh $dir$file
	      break
	      ;;

      	      "No")
	      # do nothing
	      break
	      ;;
	      esac
            done
	  #end select (Yes/No)

	  echo "Use picture as desktop background ?"
	  # Loop 5 (the confirmation choice)
	  select yn in Yes No;
	    do
	      case "$yn" in
	      
	      "Yes")
	      # change desktop background
	      feh --bg-fill $dir$file
	      break 5
	      ;;

      	      "No")
	      # do nothing
	      break 5
              ;;
	      esac
      	    done
	  #end select (Yes/No)
	  ;;
          esac
        done
      #end select (file)
      ;;
      esac
    done
  #end select (directory)
  echo "\n"
done
#end while
