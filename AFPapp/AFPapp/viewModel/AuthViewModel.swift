//
//  AuthViewModel.swift
//  Swifty
//
//  Created by Alessio Accardo on 15/02/25.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    func createUser(withEmail email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            // Creiamo l'oggetto User SENZA ID (Firestore lo assegnerà automaticamente)
            let user = User(username: username, email: email, punteggio: 0, posizione: 0)
            
            // Salviamo l'oggetto User in Firestore
            try Firestore.firestore()
                .collection("users")
                .document(result.user.uid)  // Usiamo direttamente l'UID come ID del documento
                .setData(from: user)  // Serializzazione automatica
            
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error: \(error.localizedDescription)")
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func signOut() async throws {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() async throws {
        guard let currentUser = Auth.auth().currentUser else { return }
        do {
            // 1. Rimuovi i dati dell'utente da Firestore (opzionale, se vuoi eliminare il documento)
            try await Firestore.firestore().collection("users").document(currentUser.uid).delete()
            
            // 2. Elimina l'account dall'autenticazione Firebase
            try await currentUser.delete()
            
            // 3. Aggiorna lo stato locale: rimuovi userSession e currentUser
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Error deleting your account: \(error.localizedDescription)")
            throw error
        }
    }

    
    func updatePunteggio(newPunteggio: Int) async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data: [String: Any] = ["punteggio": newPunteggio]
        
        do {
            try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Void, Error>) in
                Firestore.firestore()
                    .collection("users")
                    .document(uid)
                    .updateData(data) { error in
                        if let error = error {
                            continuation.resume(throwing: error)
                        } else {
                            continuation.resume(returning: ())
                        }
                    }
            }
            // Aggiorna il punteggio localmente dopo il successo dell'update
            self.currentUser?.punteggio = newPunteggio
        } catch {
            print("DEBUG: Failed to update points: \(error.localizedDescription)")
        }
    }


    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)

        // Cerca la posizione dell'utente attuale nella leaderboard
        let querySnapshot = try? await Firestore.firestore()
            .collection("users")
            .order(by: "punteggio", descending: true)
            .getDocuments()

        if let documents = querySnapshot?.documents {
            for (index, document) in documents.enumerated() {
                if document.documentID == uid {
                    let newPosition = index + 1
                    self.currentUser?.posizione = newPosition

                    try? await Firestore.firestore()
                        .collection("users")
                        .document(uid)
                        .updateData(["posizione": newPosition])
                    
                    break
                }
            }
        }
    }
}

extension AuthViewModel {
    func validateCredentials(email: String, password: String) async -> String? {
        do {
            _ = try await Auth.auth().signIn(withEmail: email, password: password)
            return nil  // Nessun errore, credenziali corrette
        } catch {
            let nsError = error as NSError
            let errorCode = AuthErrorCode(rawValue: nsError.code)

            // DEBUG: Stampa il codice esatto per capire il problema
            print("Errore autenticazione: \(error.localizedDescription)")
            print("Codice errore: \(nsError.code)")

            switch errorCode {
            case .userNotFound:
                return "Email is not registered."
            case .wrongPassword:
                return "Wrong Password."
            case .invalidEmail:
                return "Email Format is not valid."
            case .tooManyRequests:
                return "Too many requests. Please try again later."
            default:
                return "Email or Password are incorrect"
            }
        }
    }
}
