//
//  DummyDuelCreator.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 7/23/25.
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
struct DummyDuelCreatorView: View {
    @State var duelSession: DuelingSession = DuelingSession(hours: 0, minutes: 15)
    

    var body: some View {
            VStack {
                //probably causes warning about presentation views
                DuelConfigView(duelSession: $duelSession)
                Button("Start Screen Dueling") {
                    initDuelingSession()
                }
                .padding(.top)
            }
    }
    /*this function initializes and starts the dueling session and
    pushes the session view onto the navigation stack
    */
    func initDuelingSession() {
        duelSession.setTimeBounds()
        let managedSettingsStore = ManagedSettingsStore()
        managedSettingsStore.shield.applicationCategories = .all(except: duelSession.duelSelection.applicationTokens)
    }
}






struct DummyDuelCreatorView_Previews: PreviewProvider {
    static var previews: some View {
        DummyDuelCreatorView()
    }
}
