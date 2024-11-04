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
    //start time is delayed by delay seconds to prevent monitoring errors
    let delay: Int
    //abstraction of apps selected in the session that will be blocked
    var duelSelection: FamilyActivitySelection
    
    private var startTime: DateComponents = DateComponents()
    private var endTime: DateComponents = DateComponents()
    
  
    init(hours: Int, minutes: Int) {
        self.minutes = minutes
        self.hours = hours
        self.delay = 0
        self.duelSelection = FamilyActivitySelection()
    }
    
    
    func createDuelTimer() -> DuelTimer {
        return DuelTimer(hours: self.hours, minutes: self.minutes)
    }
    
    /*
    sets self.startTime to *delay* seconds after the time at the function call
    sets self.endTime to self.hours:self.minutes after the start time
    */
    mutating func setTimeBounds() {
        let calendar = Calendar.current
        let now = Date()
        //set seconds to whatever the delay is
        let sessionLength = DateComponents(hour: self.hours, minute: self.minutes, second: self.delay)
        let delay = DateComponents(second: self.delay)
        let startTimeDate = calendar.date(byAdding: delay, to: now, wrappingComponents: false)
        let endTimeDate = calendar.date(byAdding: sessionLength, to: now, wrappingComponents: false)
        
        self.startTime = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: startTimeDate!)
        self.endTime = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: endTimeDate!)
    }
    
    
    func getStartTime() -> DateComponents {
        return startTime
    }
    
    
    func getEndTime() -> DateComponents {
        return endTime
    }
    
    
    func getTotalSeconds() -> Int {
        return (self.hours * 3600) + (self.minutes * 60)
    }
    
}


//view for selecting specific apps that is currently not in use

/*
Button(action: {
    isShowingAppSheet = true
}) {
    ListCellView(text: "Select apps to block")
}
.sheet(isPresented: $isShowingAppSheet) {
    AppPickerView(duelSession: $duelSession, isShowingAppSheet: $isShowingAppSheet)
}
*/
