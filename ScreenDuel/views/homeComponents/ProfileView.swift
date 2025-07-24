//
//  ProfileView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 6/23/25.
//

import Foundation
import SwiftUI


struct ProfileView: View {
    
    @EnvironmentObject private var routeManager: NavigationRouter
    
    var body: some View {
        List {
            Section(header: Text("Profile")) {
                ForEach(profileOptions) {option in
                    NavigationLink(value: option.name) {
                        Text(option.title)
                    }
                }
            }
            Section(header: Text("Duel Options")) {
                ForEach(duelOptions) {option in
                    NavigationLink(value: option.name) {
                        Text(option.title)
                    }
                }
            }
            Section(header: Text("Match Performance")) {
                /*TODO*/
            }
        }
    }
}


struct ProfileView_Preview: PreviewProvider {
    @State static var path: NavigationPath = .init()
    static var previews: some View {
        ProfileView()
            .environmentObject(NavigationRouter())
    }
}

