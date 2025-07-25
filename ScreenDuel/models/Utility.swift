//
//  Utility.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 7/24/25.
//

import Foundation
import SwiftUI


func getDefaults() {
    if let userDefaults = UserDefaults(suiteName: "group.com.ScreenDuel") {
        print(Array(userDefaults.dictionaryRepresentation()))
    }
    else{
        print("error with dict conversion")
    }
}


func setLoggedIn(){
    if let userDefaults = UserDefaults(suiteName: "group.com.ScreenDuel") {
        userDefaults.setValue(false, forKey: "signedIn")
    }
    else {
        print("error setting value")
    }
}


func isLoggedIn() -> Bool {
    if let userDefaults = UserDefaults(suiteName: "group.com.ScreenDuel") {
        return userDefaults.bool(forKey: "signedIn")
    } else {
        print("key doesn't exist, defaulting to signed out")
        return false  // Default fallback
    }
}


/*
func isSignedIn() -> Bool {
    if let userDefaults = UserDefaults(suiteName: "group.com.ScreenDuel") {
        if let value = userDefaults.bool(forKey: "signedIn") {
            return value
        } else {
            
        }
    } else {
        print("error in first block")
    }
}
*/
