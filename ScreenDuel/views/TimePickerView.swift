//
//  TimePickerView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/21/24.
//

import Foundation
import SwiftUI

/*
 This view allows the user to select the
 duration of their duel session
 */
struct TimePickerView: View {
    @Binding var isShowingTimeSheet: Bool
    @Binding var duelingSession: DuelingSession
    let hourOptions = Array(0...23)
    let minuteOptions = Array(1...59)
    
    var body: some View {
        VStack {
            HStack {
                Picker("Select hours", selection: $duelingSession.hours) {
                    ForEach(hourOptions, id: \.self) { number in
                        Text("\(number) hours")
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Picker("Select minutes", selection: $duelingSession.minutes) {
                    ForEach(minuteOptions, id: \.self) { number in
                        Text("\(number) minutes")
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            Button("Save Time", action: {isShowingTimeSheet = false})
        }
    }
}
