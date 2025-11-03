#!/bin/bash
caffeinate -d &
while true;
do
   osascript -e 'tell application "System Events" to key code 103' 
   sleep 0.25
   osascript -e 'tell application "Terminal" to activate'
   sleep 0.25
   osascript -e 'tell application "DBeaver" to activate'
   sleep 0.25
   osascript -e 'tell application "Microsoft Outlook" to activate'
   sleep 0.25
   osascript -e 'tell application "Visual Studio Code" to activate'
   sleep 0.25
   osascript -e 'tell application "Google Chrome" to activate'
   sleep 0.25
   osascript -e 'tell application "Microsoft Teams" to activate'
   sleep 0.25
   osascript -e 'tell application "System Events" to keystroke "2" using {command down}'
   sleep 0.25
   osascript -e 'tell application "System Events" to key code 103' 
   sleep 0.25
   osascript -e 'tell application "Terminal" to activate'
   sleep 10
done
