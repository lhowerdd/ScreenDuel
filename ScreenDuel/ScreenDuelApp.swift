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
It will request authorization for the screen time capabilility
and will not enter the main app until this authorization
is granted
*/


/*TODO: Check family controls authorization when returning from background*/
@main
struct ScreenDuelApp: App {

    @StateObject var familyControlsAuthorizer: FamilyControlsAuthorizer = FamilyControlsAuthorizer()
    
    @State var loggedIn: Bool
    
    init() {
        self.loggedIn = isLoggedIn()
    }
    
    
    var body: some Scene {
        WindowGroup {
            if familyControlsAuthorizer.authorized {
                
                if !loggedIn {
                    LoginView(loggedIn: $loggedIn)
                }
                
                else {
                    AppView()
                }
                
            }
            else {
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
    //dispatch queue ensures changes to authorization are published on the main thread
    final func authorize() async {
        let center = AuthorizationCenter.shared
        do {
            try await center.requestAuthorization(for: FamilyControlsMember.individual)
            DispatchQueue.main.async {
                self.authorized = true
            }
        }
        catch {
            print("authorization failed")
            DispatchQueue.main.async{
                self.authorized = false
            }
        }
    }
}


