//
//  ListCellView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 8/21/24.
//

import Foundation
import SwiftUI

//This view just makes the config options look nicer in light mode
struct ListCellView: View {
    
    var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(text)
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 1)
    }
    
}
