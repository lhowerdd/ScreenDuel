//
//  DuelSessionView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/20/24.
//

import Foundation
import SwiftUI
import ManagedSettings

/*
 This view is presnted while the duel session is
 in progress and displays how much time is remaining.
 */
struct DuelSessionView: View {
    @Binding var navPath: [Int]
    @Binding var sessionInProgress: Bool
    @State var duelSession: DuelingSession
    let backgroundTimer: BackgroundTimer
    
    
    
    let notificationCenter = NotificationCenter.default
    
    var body: some View {
        VStack{
            VStack {
                Text(formatTime(totalSeconds: backgroundTimer.secondsRemaining))
                    .monospacedDigit()
                    .bold()
            }
            .contentTransition(.numericText())
            Text("start time: \(formatDate(duelSession.getStartTime()))")
            Text("end time: \(formatDate(duelSession.getEndTime()))")
            Text("in duel session")
            if(backgroundTimer.isRunning == false) {
                Button(action: {endSession()})
                {Text("Exit duel session")}
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onAppear() {
            do {
                backgroundTimer.start()
            }
        }
        .onReceive(NotificationCenter.default.publisher(
            for: UIScene.willEnterForegroundNotification)) {_ in 
                print("foreground notification received")
                backgroundTimer.start()
            }
        .onReceive(NotificationCenter.default.publisher(
            for: UIScene.didEnterBackgroundNotification)) {_ in
                print("background notification received")
                backgroundTimer.stop()
            }
    }
    
    
    func endSession() {
        let managedSettingsStore = ManagedSettingsStore()
        //managedSettingsStore.shield.applicationCategories = nil
        managedSettingsStore.shield.applicationCategories = ShieldSettings.ActivityCategoryPolicy<Application>.none
        navPath = []
        sessionInProgress = false
    }
}


func formatTime(totalSeconds: Int) -> String {
    var minutes = totalSeconds / 60
    let hours = minutes / 60
    minutes = minutes % 60
    let seconds = totalSeconds % 60
    return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
}


func formatDate(_ dateComp: DateComponents) -> String {
    guard let hour = dateComp.hour,
        //let year = dateComp.year,
        //let month = dateComp.month,
        //let day = dateComp.day,
        let minute = dateComp.minute,
        let second = dateComp.second
        else {
            return ""
        }
    //return String(format: "%d/%d/%d at %02d:%02d:%02d", month, day, year, hour, minute, second)
    return String(format: "%02d:%02d:%02d", hour, minute, second)
}
