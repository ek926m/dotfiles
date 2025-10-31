#!/bin/bash
caffeinate -d &
while true;
do
   osascript -e 'tell application "System Events" to key code 103' 
   sleep 1
   osascript -e 'tell application "Terminal" to activate'
   sleep 1
   osascript -e 'tell application "DBeaver" to activate'
   sleep 1
   osascript -e 'tell application "Microsoft Outlook" to activate'
   sleep 1
   osascript -e 'tell application "Visual Studio Code" to activate'
   sleep 1
   osascript -e 'tell application "Google Chrome" to activate'
   sleep 1
   osascript -e 'tell application "Microsoft Teams" to activate'
   sleep 1
   osascript -e 'tell application "System Events" to keystroke "2" using {command down}'

   sleep 10
done
