//
//  AppView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/5/24.
//

import Foundation
import SwiftUI



//navigation stack hierarchy
enum MenuOptions: Identifiable {
    var id: Self {
        return self
    }
    
    case editProfile
    case settings
    case addFriends
    
}

enum AppRoute: Hashable, Identifiable {
    var id: Self {
        return self
    }
    
    case profile
    case menu(MenuOptions)
}



/*
 This view holds the main app navigation hierarchy.
 Currently the user can swipe between the DuelCreatorView and a
 dummy placeholder view
 */
struct AppView: View {
    
    @StateObject private var routerManager = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $routerManager.routes) {
            VStack {
                TopBar(
                    routerManager: routerManager
                )
                
                Divider()
                
                TabView {
                    DummyDuelCreatorView()
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
            .navigationDestination(for: Route.self) {$0}
            
           
        }
        .environmentObject(routerManager)
    }
}
struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

