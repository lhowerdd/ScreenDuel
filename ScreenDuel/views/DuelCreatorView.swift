//
//  DuelCreatorView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/6/24.
//

import Foundation
import SwiftUI
import DeviceActivity


/*
 This view allows the user to configure the settings for
 their screen duel session.
 */
struct DuelCreatorView: View {
    @State var duelSession: DuelingSession = DuelingSession(hours: 0, minutes: 15)
    
    //array that allows us to programatically return to this view after session is over
    @State private var navPath: [Int] = []
    @State private var sessionInProgress = false
    @State var monitorErrorOccured = false
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                
                DuelConfigView(duelSession: $duelSession)
        
                Button("Start Screen Dueling") {
                    initDuelingSession()
                }
                .padding(.top)
                //present the duelSession once button is pressed
                .navigationDestination(isPresented: $sessionInProgress) {
                    DuelSessionView(navPath: $navPath, sessionInProgress: $sessionInProgress, duelSession: duelSession, duelTimer: duelSession.createDuelTimer())
                }
                if monitorErrorOccured {
                    Text("There was an error with the screen duel session")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.red)
                }
                
            }
            .navigationBarHidden(true)
        }
    }
    
    /*this function initializes and starts the dueling session and
    pushes the session view onto the navigation stack
    */
    func initDuelingSession() {
        duelSession.setTimeBounds()
        let schedule = DeviceActivitySchedule(intervalStart: duelSession.getStartTime(), intervalEnd: duelSession.getEndTime(), repeats: false)
        let center = DeviceActivityCenter()
        let duelMessenger = DuelMessenger()
        //this writes the FamilyActivitySelection to the shared userDefaults and calls the app extension
        do {
            duelMessenger.encodeDuelSelection(selection: duelSession.duelSelection)
            print("before monitor")
            try center.startMonitoring(.duelSession, during: schedule)
            print("after monitor")
            //push DuelSessionView onto nav stack (see navigation destination)
            navPath.append(1)
            sessionInProgress = true
        }
        catch {
            monitorErrorOccured = true
            print("Error Info: \(error)")
        }
    }
}


extension DeviceActivityName {
    static let duelSession = Self("duelSession")
}



struct DuelCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        DuelCreatorView()
    }
}



