//
//  CreateAccountView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 7/25/25.
//

import Foundation
import SwiftUI

import SwiftUI

struct CreateAccountView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @State private var showPassword: Bool = false
    @State private var errorMessage: String?
 
    
    @Binding var showingSignUpSheet: Bool
    
    
    var handleLogin: () -> Void
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign Up For ScreenDuel")
                .font(.largeTitle)
                .bold()

            TextField("Username", text: $username)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
                .autocapitalization(.none)

            if showPassword {
                TextField("Password", text: $password)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
                    .autocapitalization(.none)
            } else {
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
            }
            
            
            if showPassword {
                TextField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
                    .autocapitalization(.none)
            } else {
                SecureField("Confirm Password", text: $confirmPassword)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
            }
            
            
            Toggle("Show Password", isOn: $showPassword)
                .padding(.horizontal)

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button(action: handleCreateAccount) {
                Text("Create Account")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            Spacer()
        }
        .padding()
    }

    func handleCreateAccount() {
        showingSignUpSheet = false
        handleLogin()
    }
}


struct CreateAccount_Previews: PreviewProvider {
    
    @State static var value2 = true
    
    static var previews: some View {
        CreateAccountView(showingSignUpSheet: $value2, handleLogin: {})
    }
}
