//
//  NavigationOptions.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 7/23/25.
//

import Foundation


protocol MainOption: Identifiable, Hashable {
    var id: Route {get}
    var title: String {get}
    var name: Route {get}
}


struct ProfileOption: MainOption {
    var id: Route {name}
    let title: String
    let name: Route
}


let profileOptions: [ProfileOption] = [
    ProfileOption(title: "Username",
                  name: .profileOption(.username)),
    ProfileOption(title: "Email",
                  name: .profileOption(.email)),
    ProfileOption(title: "Phone Number",
                  name: .profileOption(.phoneNumber)),
    ProfileOption(title: "Password",
                  name: .profileOption(.password))
]


struct DuelOption: MainOption {
    var id: Route {name}
    let title: String
    let name: Route
}


let duelOptions: [DuelOption] = [
    DuelOption(title: "Victory Sound", name: .duelOption(.victorySound))
]
