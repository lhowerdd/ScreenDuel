//
//  AppView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/5/24.
//

import Foundation
import SwiftUI


/*
 This view holds the main app navigation hierarchy.
 Currently the user can swipe between the DuelCreatorView and a
 dummy placeholder view
 */
struct AppView: View {

    @State private var profileOpen = false
    
    var body: some View {
        NavigationStack() {
            VStack {
                TopBar(
                    onProfileTap: {
                        profileOpen = true
                    },
                    onBellTap: {
                        return
                    }
                )
                
                Divider()
                
                TabView {
                    DuelCreatorView()
                        .tabItem {
                            Image(systemName: "shield.slash").font(.system(size: 40))
                        }
                    Text("duel score")
                        .tabItem {
                            Image(systemName: "brain.fill").font(.system(size: 40))
                        }
                }
                .tabViewStyle(PageTabViewStyle())
            }
            .navigationDestination(isPresented: $profileOpen) {
                ProfileView()
            }
        }
    }
}


struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
