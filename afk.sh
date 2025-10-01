#!/bin/bash
caffeinate -d &
while true;
do
   osascript -e 'tell application "Microsoft Teams" to activate'
   osascript -e 'tell application "System Events" to keystroke "2" using {command down}'
   #echo "refreshed"
   sleep 290
done

# alias afk='/Users/ekai/afk.sh'
