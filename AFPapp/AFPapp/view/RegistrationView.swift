//
//  RegistrationView.swift
//  Swifty
//
//  Created by Alessio Accardo on 15/02/25.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @Environment(\.dismiss) var dismiss  // Dismiss l'ambiente per tornare alla LoginView2
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Spacer()
        VStack {
            InputView(text: $email,
                      title: "Email",
                      placehodler: "Enter Your Email")
            .autocapitalization(.none)
            
            InputView(text: $username,
                      title: "Username",
                      placehodler: "User12")
            
            InputView(text: $password,
                      title: "Password",
                      placehodler: "Enter Your Password",
                      isSecureField: true)
            
            InputView(text: $confirmPassword,
                      title: "Confirm Password",
                      placehodler: "Confirm Your Password",
                      isSecureField: true)
        }
        .padding(.horizontal)
        .padding(.bottom, 30)
        
        Button {
            Task {
                try await viewModel.createUser(withEmail: email,
                                               password: password,
                                               username: username)
            }
        } label: {
            HStack {
                Text("SIGN UP")
                    .fontWeight(.semibold)
                Image(systemName: "chevron.right")
            }
            .frame(width: UIScreen.main.bounds.width - 80, height: 20)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color.blue)
        .disabled(!formIsValid)
        .opacity(formIsValid ? 1 : 0.5)
        .cornerRadius(20)
        
        Spacer()
        
        // Aggiungi il pulsante per tornare indietro a LoginView2
        Button {
            dismiss()  // Questo farà tornare alla LoginView2
        } label: {
            HStack {
                Text("Already have an account?")
                Text("Sign In")
                    .fontWeight(.bold)
            }
            .font(.system(size: 14))
            .foregroundStyle(.black)
        }
        .padding()
    }
}


extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@")
                && !username.isEmpty
                && !password.isEmpty && password.count > 5
                && !confirmPassword.isEmpty
                && password == confirmPassword
    }
}


#Preview {
    RegistrationView()
        .environmentObject(AuthViewModel())
}
