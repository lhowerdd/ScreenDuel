//
//  DuelConfigView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/21/24.
//

import Foundation
import SwiftUI
import ManagedSettings
import FamilyControls
import DeviceActivity
/*
This view holds sub views that allows the user to
select the apps they want to block during their duel
session and how long they want to block them for
*/
struct DuelConfigView: View {
    
    @Binding var duelSession: DuelingSession
    @State var isShowingTimeSheet = false
    @State var isShowingAppSheet = false
    
    var body: some View {
        VStack {
        
            Section(header: Text("Create a ScreenDuel Session")){
                
                Button(action: {
                    isShowingTimeSheet = true
                }) {
                    ListCellView(text: "Session Length: \(duelSession.hours)h \(duelSession.minutes)m")
                }
                .sheet(isPresented: $isShowingTimeSheet) {
                    TimePickerView(isShowingTimeSheet: $isShowingTimeSheet , duelingSession: $duelSession)
                }
                
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
                
            }
        }
        
    }
    
    
    
}
