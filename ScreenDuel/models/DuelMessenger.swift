//
//  DuelMessenger.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/21/24.
//

import Foundation
import FamilyControls


/*
this struct provides methods that write and fetch
the FamilyActivitySelection to the app groups shared userDefaults
so that the app extension can access it
*/
 struct DuelMessenger {
    
    func encodeDuelSelection(selection: FamilyActivitySelection) {
        do {
            let encoder = JSONEncoder()
            let encodedSelection = try encoder.encode(selection)
            if let userDefaults = UserDefaults(suiteName: "group.com.ScreenDuel") {
                userDefaults.set(encodedSelection, forKey: "DuelSession")
            }
        }
        catch {
            print("encoding error: \(error)")
        }
    }
    
    
    func decodeDuelSelection() -> FamilyActivitySelection {
        var duelSelection = FamilyActivitySelection()
        if let userDefaults = UserDefaults(suiteName: "group.com.ScreenDuel") {
            do {
                if let encodedSelection = userDefaults.data(forKey: "DuelSession") {
                    let decoder = JSONDecoder()
                    let selection = try decoder.decode(FamilyActivitySelection.self, from: encodedSelection)
                    duelSelection = selection
                }
            }
            catch {
                print("decoding error: \(error)")
            }
        }
        return duelSelection
    }
     
     func clearSession() {
         if let userDefaults = UserDefaults(suiteName: "group.com.ScreenDuel") {
             userDefaults.removeObject(forKey: "DuelSession")
         }
     }
    
    
}
