//
//  Route.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 7/23/25.
//  Credit to Tunde Adegoroye's Youtube Tutorial

import Foundation
import SwiftUI

//routes to different screens in navigation hierarchy
enum Route {
    case profile
    
    case profileOption(profileRoute)
    enum profileRoute {
        case username
        case email
        case phoneNumber
        case password
    }
    
    case duelOption(duelRoute)
    enum duelRoute {
        case victorySound
    }
}


extension Route.profileRoute: Hashable {}
extension Route.duelRoute: Hashable {}

extension Route: Hashable {
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.profile, .profile):
            return true
        case let (.profileOption(a), .profileOption(b)):
            return a == b
        case let (.duelOption(a), .duelOption(b)):
            return a==b
        default:
            return false
        }
    }

    func hash(into hasher: inout Hasher) {
        switch self {
        case .profile:
            hasher.combine(0)
        case .profileOption(let route):
            hasher.combine(1)
            hasher.combine(route)
        case .duelOption(let route):
            hasher.combine(1)
            hasher.combine(route)
        }
    }
}


extension Route: View {
    var body: some View {
        
        switch self {
            
        case .profile:
            ProfileView()
            
        case .profileOption(.username):
            EditProfileView()
        case .profileOption(.email):
            EditProfileView()
        case .profileOption(.phoneNumber):
            EditProfileView()
        case .profileOption(.password):
            EditProfileView()
            
        case .duelOption(.victorySound):
            EditProfileView()
        }
                
    }
}
