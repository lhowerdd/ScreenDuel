//
//  File.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 6/23/25.
//

import Foundation
import SwiftUI

struct TopBar: View {
    
    var onProfileTap: () -> Void
    var onBellTap: () -> Void
    
    
    var body: some View {
        HStack {
            Button(action: {
                onProfileTap()
            }) {
                Image(systemName: "person.crop.circle")
            }
            .font(.system(size: 24))
            .padding(5)
            
            Spacer()
            
            Button(action: {
                onBellTap()
            }) {
                Image(systemName: "bell")
            }
            .font(.system(size: 24))
            .padding(5)
        }
    }
}

/*
struct TopBar_Previews: PreviewProvider {
 static var previews: some View {
    TopBar()
  }
}
 */
