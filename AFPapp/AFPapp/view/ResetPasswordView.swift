//
//  ResetPasswordView.swift
//  Swifty
//
//  Created by Alessio Accardo on 18/02/25.
//

import SwiftUI
import FirebaseAuth

struct ResetPasswordView: View {
    @State private var email: String = ""
    @State private var message: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Reset Your Password")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .padding()
            
            TextField("Inserisci la tua email", text: $email)
                .autocapitalization(.none)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(8)
                .frame(width: UIScreen.main.bounds.width - 20)
                .padding()
            
            Button(action: {
                Task {
                    await resetPassword()
                }
            }) {
                Text("Reimposta Password")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width - 20)
                    .background(LinearGradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor],
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing))
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1 : 0.5)
                    .cornerRadius(8)
            }
            
            if !message.isEmpty {
                Text(message)
                    .foregroundColor(.green)
                    .padding()
            }
            
            Spacer()
        }
    }
    
    func resetPassword() async {
        do {
            try await Auth.auth().sendPasswordReset(withEmail: email)
            await MainActor.run {
                message = "Email di reimpostazione inviata!"
            }
        } catch {
            await MainActor.run {
                message = "Errore: \(error.localizedDescription)"
            }
        }
    }
}

extension ResetPasswordView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@")
    }
}


#Preview {
    ResetPasswordView()
}
