//
//  AppPicker.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/6/24.
// heavily inspired by the apple documentation

import Foundation
import SwiftUI
import FamilyControls

/*
This view allows the users to selects the apps
 they would like to block during their duel session
*/
struct AppPickerView: View {
    @Binding var duelSession: DuelingSession
    @Binding var isShowingAppSheet: Bool
    
    
    var body: some View {
        VStack {
            Image(systemName: "eye")
                .font(.system(size: 76.0))
                .padding()
            
            FamilyActivityPicker(selection: $duelSession.duelSelection)
            
            Image(systemName: "hourglass")
                .font(.system(size: 76.0))
                .padding()
            
            Button("Save Selection", action: {isShowingAppSheet = false})
            
        }
    }
}
