//
//  DuelCreatorView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/6/24.
//

import Foundation
import SwiftUI
import DeviceActivity
import ManagedSettings
import FamilyControls

/*
 This view allows the user to configure the settings for
 their screen duel session.
 */
struct DuelCreatorView: View {
    @State var duelSession: DuelingSession = DuelingSession(hours: 0, minutes: 15)
    
    //array that allows us to programatically return to this view after session is over
    @State private var navPath: [Int] = []
    @State private var sessionInProgress = false
    
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                //probably causes warning about presentation views 
                DuelConfigView(duelSession: $duelSession)
                Button("Start Screen Dueling") {
                    initDuelingSession()
                }
                .padding(.top)
            }
            .navigationDestination(isPresented: $sessionInProgress) {
                DuelSessionView(navPath: $navPath, sessionInProgress: $sessionInProgress, duelSession: duelSession, backgroundTimer: BackgroundTimer(seconds: duelSession.getTotalSeconds()))
            }
            .navigationBarHidden(true)
        }
    }
    /*this function initializes and starts the dueling session and
    pushes the session view onto the navigation stack
    */
    func initDuelingSession() {
        duelSession.setTimeBounds()
        let managedSettingsStore = ManagedSettingsStore()
        managedSettingsStore.shield.applicationCategories = .all(except: duelSession.duelSelection.applicationTokens)
        //push DuelSessionView onto nav stack (see navigation destination)
        navPath.append(1)
        sessionInProgress = true
        
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



