# ScreenDuel 

## Overview
The goal of this project is to create an ios application that allows users to limit their screen time usage by forcefully blocking their apps. While many apps already provide this functionality, ScreenDuel seeks to differ itself by allowing users to achieve this goal by keeping each other accountable and both having the same categories of apps blocked at the same times. 

## Implementation Strategy
The current approach is to use the ScreenTime API provided by Apple to shield the users applications. Some kind of connection, possibly via bluetooth or a remote server, will be used to connect users before a "ScreenDuel Session" to ensure that the same rules are applied to each phone. 

## Current Sate Of The Project
This project is still in a very preliminary stage. At this time I am working on configuring the 
```DeviceActivityMonitorExtension``` found in the **PhoneBlocker** directory. This extension is the entry point for shielding and unshielding applications on the users ios device.

## Current Issues
The main roadblock at this point is getting code to run inside the ```DeviceActivityMonitorExtension```. 
These are the current steps that have been taken to further narrow down the issue
1. Authentication for ScreenTime is granted at the apps entry point
2. The app and its extension have both been granted the App Groups and Family Controls Capabilities
3. Both the app and its extension are in the same app group
4. The app attempts to write the ```FamilyActivitySelection``` to the app groups shared userDefaults, but this needs furhter testing to confirm.
5. In progress


NOT COMPLETE
