#!/bin/bash

#start:
#echo "Main Menu"
#echo "1 for Copy"
#echo "2 for exit"
#read NUM
#case $NUM in
#"1")
#echo "CopyNUM"
#goto start:;
#"2")
#echo "Haiiii";
#goto start:
#*)
#echo "ssss";
#esac
#推荐答案
#正如其他人所指出的，bash(或其他类似POSIX的外壳)中没有goto-其他更灵活的流控制构造采用地点.
#在man bash中查找标题Compound Commands.
#
#对于您来说，select命令是正确的选择. 由于使用方法可能并不明显，因此您可以开始以下操作:
#
##!/usr/bin/env bash

echo "Main Menu"

# Define the choices to present to the user, which will be
# presented line by line, prefixed by a sequential number
# (E.g., '1) copy', ...)
choices=( 'copy' 'exit' )

# Present the choices.
# The user chooses by entering the *number* before the desired choice.
select choice in "${choices[@]}"; do

  # If an invalid number was chosen, $choice will be empty.
  # Report an error and prompt again.
  [[ -n $choice ]] || { echo "Invalid choice." >&2; continue; }

  # Examine the choice.
  # Note that it is the choice string itself, not its number
  # that is reported in $choice.
  case $choice in
    copy)
      echo "Copying..."
      # Set flag here, or call function, ...
      ;;
    exit)
      echo "Exiting. "
      exit 0
  esac

  # Getting here means that a valid choice was made,
  # so break out of the select statement and continue below,
  # if desired.
  # Note that without an explicit break (or exit) statement,
  # bash will continue to prompt.
  break

done


