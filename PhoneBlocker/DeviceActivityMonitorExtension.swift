//
//  DeviceActivityMonitorExtension.swift
//  PhoneBlocker
//
//  Created by Leo Howerdd on 8/21/24.
//

import DeviceActivity
import ManagedSettings
import FamilyControls
import Foundation



// Optionally override any of the functions below.
// Make sure that your class name matches the NSExtensionPrincipalClass in your Info.plist.

/*
This class is the app extension that shields apps during the duel session
*/
class DeviceActivityMonitorExtension: DeviceActivityMonitor {
    
    let store = ManagedSettingsStore()
    
    override func intervalDidStart(for activity: DeviceActivityName) {
        print("inside extension")
        super.intervalDidStart(for: activity)
        let duelMessenger = DuelMessenger()
        let applications = duelMessenger.decodeDuelSelection().applicationTokens
        store.shield.applications = applications.isEmpty ? nil : applications
        // Handle the start of the interval.
    }
    
    override func intervalDidEnd(for activity: DeviceActivityName) {
        super.intervalDidEnd(for: activity)
        store.shield.applications = nil
        // Handle the end of the interval.
    }
    
    /*
    override func eventDidReachThreshold(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        super.eventDidReachThreshold(event, activity: activity)
        
        // Handle the event reaching its threshold.
    }
    
    override func intervalWillStartWarning(for activity: DeviceActivityName) {
        super.intervalWillStartWarning(for: activity)
        
        // Handle the warning before the interval starts.
    }
    
    override func intervalWillEndWarning(for activity: DeviceActivityName) {
        super.intervalWillEndWarning(for: activity)
        
        // Handle the warning before the interval ends.
    }
    
    override func eventWillReachThresholdWarning(_ event: DeviceActivityEvent.Name, activity: DeviceActivityName) {
        super.eventWillReachThresholdWarning(event, activity: activity)
        
        // Handle the warning before the event reaches its threshold.
    }
    */
}
