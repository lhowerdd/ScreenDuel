# ScreenDuel 

## Overview
The goal of this project is to create an ios application that allows users to limit their screen time usage by forcefully blocking their apps. While many apps already provide this functionality, ScreenDuel seeks to differ itself by allowing users to achieve this goal by keeping each other accountable and both having the same categories of apps blocked at the same times. 

## Implementation Strategy
The current approach is to use the ScreenTime API provided by Apple to shield the users applications. Some kind of connection, possibly via bluetooth or a remote server, will be used to connect users before a "ScreenDuel Session" to ensure that the same rules are applied to each phone. 

## Current Sate Of The Project
This project is still in a very preliminary stage. At this time I am working on configuring the 
```DeviceActivityMonitorExtension``` found in the **PhoneBlocker** directory. This extension is the entry point for shielding and unshielding applications on the users ios device.

## Current Issues
### shielding extension
The main roadblock at this point is getting code to run inside the ```DeviceActivityMonitorExtension```. 
These are the current steps that have been taken to further narrow down the cause of this issue
1. Authentication for FamilyControls is granted at the apps entry point
2. The app and its extension have both been granted the ```App Groups``` and ```Family Controls``` Capabilities
3. Both the app and its extension are in the same app group
4. The PhoneBlocker extension's ```NSExtensionPrincipialClass``` found in the plist is the same as the class name in the swift file.
5. The app attempts to write the ```FamilyActivitySelection``` to the app groups shared userDefaults, but this needs further testing to confirm.
6. The ```intervalStart``` parameter for the ```DeviceActivitySchedule``` is offset by 20 seconds in order to prevent the ```invalidDateComponents``` error

### countdown clock
The timer that displays how much time is remaining in ```DuelSessionView``` currently decrements by 2 seconds instead of 1. The cause of this issue is still unknown as it was previously working as intended. 

## Other goals
1. Improving the UI is the next on the priority list after getting the basic functionality to work.
2. Need to add an app icon at some point
3. perhaps configure light/dark mode

## How to run
I have developed this project with xcode 15.4 on my mac. The simulator provided by XCode does not seem to work well with the authorizing ```FamilyControls``` (maybe this is just my machine) so I build and run the application on my iPhone which currently has IOS 17.5.1. When setting up this project locally, ensure that both the main app and the ```DeviceActivityMonitorExtension``` (you will need to add this) are given the ```App Groups``` and ```Family Controls ```capabilities and that they are both in the same app group. Finally make sure that the class name in the extension is the same as the NSExtensionPrincipalClass in the Info.plist (info tab in project view).

## previous commit history 
Earlier commit history for this project can be found at [old repo](https://github.com/lhowerdd/ScreenDuel_OLD). 
