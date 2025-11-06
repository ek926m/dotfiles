#!/bin/bash
caffeinate -d &
while true;
do
   osascript -e 'tell application "System Events" to key code 103' 
   sleep 0.3
   osascript -e 'tell application "Terminal" to activate'
   sleep 0.1
   osascript -e 'tell application "DBeaver" to activate'
   sleep 0.1
   osascript -e 'tell application "Microsoft Outlook" to activate'
   sleep 0.1
   osascript -e 'tell application "Visual Studio Code" to activate'
   sleep 0.1
   osascript -e 'tell application "Google Chrome" to activate'
   sleep 0.1
   osascript -e 'tell application "Terminal" to activate'
   sleep 2.5
   osascript -e 'tell application "Microsoft Teams" to activate'
   sleep 0.5
   osascript -e 'tell application "System Events" to keystroke "2" using {command down}'
   sleep 4.5
done
