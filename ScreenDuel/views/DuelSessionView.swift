//
//  DuelSessionView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/20/24.
//

import Foundation
import SwiftUI


/*
 This view is presnted while the duel session is
 in progress and displays how much time is remaining
 */
struct DuelSessionView: View {
    
    @Binding var navPath: [Int]
    @Binding var sessionInProgress: Bool
    @State var duelSession: DuelingSession
    let duelTimer: DuelTimer
    
    
    var body: some View {
        VStack{
            //display the decrementing time
            VStack {
                Text(formatTime(totalSeconds: duelTimer.timeRemaining))
                    .monospacedDigit()
                    .bold()
            }
            .contentTransition(.numericText())
            
            //pause and play buttons
            
            HStack {
                Button {duelTimer.startTimer()}
                    label: { Image(systemName: "play.fill")}
                    .disabled(duelTimer.playButtonDisabled)
                Button {duelTimer.stopTimer()}
                    label: {Image(systemName: "pause.fill")}
                    .disabled(duelTimer.pauseButtonDisabled)
            }
            
            Text("start time: \(formatDate(duelSession.getStartTime()))")
            Text("end time: \(formatDate(duelSession.getEndTime()))")
            
            Text("in duel session")
            //button that appears after duel session is over
            
            if(duelTimer.isTimerRunning == false) {
                Button(action: {
                    navPath = []
                    sessionInProgress = false
                    }) {
                    Text("Exit duel session")}
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .onAppear() {
            do {
                duelTimer.startTimer()
            }
        }
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
        let year = dateComp.year,
        let month = dateComp.month,
        let day = dateComp.day,
        let minute = dateComp.minute,
        let second = dateComp.second 
        
        else {
            return ""
        }
    return String(format: "%d/%d/%d at  %02d:%02d:%02d", month, day, year, hour, minute, second)
}
