//
//  NavigationRouter.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 7/23/25.
//  Credit to Tunde Adegoroye's Youtube Tutorial

import Foundation
import SwiftUI

final class NavigationRouter: ObservableObject {
    
    @Published var routes = [Route]()
    
    func push(to screen: Route) {
        routes.append(screen)
    }
    
    func goBack() {
        _ = routes.popLast()
    }
    
    func reset() {
        routes = []
    }
}
