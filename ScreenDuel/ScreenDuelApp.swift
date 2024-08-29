//
//  ScreenDuelApp.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 7/7/24.
//

import SwiftUI
import FamilyControls

/*
This struct is the entry point to the app.
It will request authorization for screen time capabilility
and will not enter the main app until this authorization
is granted
*/
@main
struct ScreenDuelApp: App {

    @StateObject var familyControlsAuthorizer: FamilyControlsAuthorizer = FamilyControlsAuthorizer()
    
    var body: some Scene {
        WindowGroup {
            if familyControlsAuthorizer.authorized {
                AppView()
            }
            else{
                Button(action: {requestAuthorization()}) {
                    Label("request authorization", systemImage: "arrow.uturn.forward.circle.fill")
                }
            }
        }
    }
    
    //requests authorization if it didn't work the first time
    func requestAuthorization() {
        Task {
            await familyControlsAuthorizer.authorize()
        }
    }
    
}

/*
This class is used to request authorization from family controls
 */
class FamilyControlsAuthorizer: ObservableObject {
    @Published var authorized = true
    
    init() {
        Task {
            await authorize()
        }
    }
    //call this to request authorization
    final func authorize() async {
        let center = AuthorizationCenter.shared
        do {
            try await center.requestAuthorization(for: FamilyControlsMember.individual)
            authorized = true
        }
        catch {
            print("authorization failed")
            authorized = false
        }
    }
}


