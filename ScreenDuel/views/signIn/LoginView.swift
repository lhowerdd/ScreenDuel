//
//  SignInView.swift
//  ScreenDuel
//
//  Created by Leo Howerdd on 7/25/25.
//

import Foundation
import SwiftUI


import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var errorMessage: String?
   
    @Binding var loggedIn: Bool
    
    @State private var showingSignUpSheet = false
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login to ScreenDuel")
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

            Toggle("Show Password", isOn: $showPassword)
                .padding(.horizontal)

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button(action: handleLogin) {
                Text("Sign In")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Button(action: {showingSignUpSheet = true}) {
                Text("Click here to create account")
            }
            .sheet(isPresented: $showingSignUpSheet)
            {
                CreateAccountView(showingSignUpSheet: $showingSignUpSheet, handleLogin: handleLogin)
            }
            

            Spacer()
        }
        .padding()
    }

    
    
    func handleLogin() {
        loggedIn = true
        /**TODO: save changes to cloud and user defaults**/
    }
}


struct LoginPreview: PreviewProvider {
 
    @State static var value = false
        
    static var previews: some View {
        LoginView(loggedIn: $value )
    }
}

