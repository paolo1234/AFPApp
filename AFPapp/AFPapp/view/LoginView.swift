//
//  LoginView.swift
//  Swifty
//
//  Created by Alessio Accardo on 15/02/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var errorMessage: String?
    @State private var showAlert: Bool = false
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView{
            VStack(spacing: 20) {
                Text("Login")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .padding(.top)
                
                Spacer()
                
                VStack {
                    InputView(text: $email,
                              title: "Email",
                              placehodler: "Enter Your Email")
                    .autocapitalization(.none)
                    
                    InputView(text: $password,
                              title: "Password",
                              placehodler: "Enter Your Password",
                              isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                Button {
                    Task {
                        let error = await viewModel.validateCredentials(email: email, password: password)
                        if let error = error {
                            errorMessage = error
                            showAlert = true
                        } else {
                            do {
                                try await viewModel.signIn(withEmail: email, password: password)
                            } catch {
                                errorMessage = error.localizedDescription
                                showAlert = true
                            }
                        }
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName: "chevron.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width - 80,
                           height: 20)
                }
                .padding()
                .background(LinearGradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1 : 0.5)
                .cornerRadius(20)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text(errorMessage ?? "An Error As Occurred"), dismissButton: .default(Text("OK")))
                }
                
                NavigationLink {
                    ResetPasswordView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Forgot Your Password?")
                        Text("Reset it here")
                            .fontWeight(.bold)
                    }
                }
                .font(.system(size: 16))
                .foregroundStyle(.black)
                .padding()
                
                Spacer()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Don't have an account yet?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 16))
                    .foregroundStyle(.black)
                    .padding(8)
                }
                .padding()
            }
        }
    }
}

struct InputView: View {
    
    @Binding var text: String
    let title: String
    let placehodler: String
    var isSecureField: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundStyle(.black)
                .fontWeight(.semibold)
                .font(.title3)
            
            if isSecureField {
                SecureField(placehodler, text: $text)
                    .font(.system(size: 14))
            } else {
                TextField(placehodler, text: $text)
                    .font(.system(size: 14))
            }
            
            Divider()
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
    
    
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
