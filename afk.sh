#!/bin/bash
caffeinate -d &
while true;
do
   osascript -e 'tell application "Microsoft Teams" to activate'
   sleep 0.25
   osascript -e 'tell application "System Events" to keystroke "2" using {command down}'
   sleep 0.25
   osascript -e 'tell application "Terminal" to activate'
   sleep 120
done
