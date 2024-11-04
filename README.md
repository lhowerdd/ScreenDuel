# ScreenDuel 

## Overview
The goal of this project is to create an ios application that allows users to limit their screen time usage by forcefully blocking their apps. While many apps already provide this functionality, ScreenDuel seeks to differ itself by adding multiplayer features in some form.

## Implementation Strategy
The current approach is to use the ScreenTime API provided by Apple to shield the users applications. Different options are currently being explored for implementing the backend, but some kind of remote database or webserver will be almost likely be needed. AWS is looking like the headliner to meet these needs.

## Current Sate Of The Project
This project is still in a very preliminary stage. At this time, the user can shield all apps that are not provided by apple themselves for a duration of time that they select. Next steps involve fixing eraneous warnings, and proceeding to implement multiplayer functionality with a backend webserver. 

## Current Issues
### shielding extension

Efforts have been made to get code to run in the ```DeviceActivityMonitorExtension```. However, this extension is likely not needed for the app to meet its goal specification, as apps can be shielded from the main app. However, for those interested, the efforts made to configure the extension are listed below.

These are the current steps that have been taken to further narrow down the cause of this issue
1. Authentication for FamilyControls is granted at the apps entry point
2. The app and its extension have both been granted the ```App Groups``` and ```Family Controls``` Capabilities
3. Both the app and its extension are in the same app group
4. The PhoneBlocker extension's ```NSExtensionPrincipialClass``` found in the plist is the same as the class name in the swift file.
5. The app attempts to write the ```FamilyActivitySelection``` to the app groups shared userDefaults, unclear if this is working within the extension, but appears to work in the main app
6. The ```intervalStart``` parameter for the ```DeviceActivitySchedule``` is offset by 5 seconds in order to prevent the ```invalidDateComponents``` error



## Other goals
1. Improving the UI is the next on the priority list after getting the basic functionality to work.
2. Need to add an app icon at some point
3. perhaps configure light/dark mode

## How to run
I have developed this project with xcode 15.4 on my mac. The simulator provided by XCode does not seem to work well with authorizing ```FamilyControls``` (maybe this is just my machine) so I build and run the application on my iPhone which currently has IOS 17.5.1. When setting up this project locally, ensure that both the main app and the ```DeviceActivityMonitorExtension``` (you will need to add this) are given the ```App Groups``` and ```Family Controls ```capabilities and that they are both in the same app group. Finally make sure that the class name in the extension is the same as the NSExtensionPrincipalClass in the Info.plist (info tab in project view).

## previous commit history 
Earlier commit history for this project can be found at [old repo](https://github.com/lhowerdd/ScreenDuel_OLD). 
