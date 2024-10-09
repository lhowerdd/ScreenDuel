//
//  DuelSessionNew.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/6/24.
//

import Foundation
import FamilyControls
import DeviceActivity


/*
this struct holds the key information about a dueling session
*/
struct DuelingSession {
    //how many hours the session is
    var hours: Int
    //how many minutes the session is
    var minutes: Int
    //abstraction of apps selected in the session
    var duelSelection: FamilyActivitySelection
    
    private var startTime: DateComponents = DateComponents()
    private var endTime: DateComponents = DateComponents()
    
  
    init(hours: Int, minutes: Int) {
        self.minutes = minutes
        self.hours = hours
        self.duelSelection = FamilyActivitySelection()
    }
    
    
    func createDuelTimer() -> DuelTimer {
        return DuelTimer(hours: self.hours, minutes: self.minutes)
    }
    
    /*/
    sets startTime to 20 seconds after the time at the function call and then adds the length of
    the duel session to startTime to calculate endTime
    */
    mutating func setTimeBounds() {
        let currentDate = Date()
        let startInterval = currentDate.addingTimeInterval(20) // 20 seconds after the current time
        
        let calendar = Calendar.current
        
        // Convert start interval to DateComponents
        startTime = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: startInterval)
        
        // Calculate end interval by adding the specified hours and minutes to the start interval
        var dateComponents = DateComponents()
        dateComponents.hour = hours
        dateComponents.minute = minutes
        
        let endInterval = calendar.date(byAdding: dateComponents, to: startInterval)!
        
        // Convert end interval to DateComponents
        endTime = calendar.dateComponents([.year,.month, .day, .hour, .minute, .second], from: endInterval)
        //return DeviceActivitySchedule(intervalStart: startComponents, intervalEnd: endComponents, repeats: false)
    }
    
    
    func getStartTime() -> DateComponents {
        return startTime
    }
    
    
    func getEndTime() -> DateComponents {
        return endTime
    }
    
    
}
