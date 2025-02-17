//
//  LeaderboardViewModel.swift
//  Swifty
//
//  Created by Alessio Accardo on 17/02/25.
//

import Foundation
import FirebaseFirestore

@MainActor
class LeaderboardViewModel: ObservableObject {
    @Published var topUsers: [User] = []

    func fetchTop3Users() async {
        do {
            let querySnapshot = try await Firestore.firestore()
                .collection("users")
                .order(by: "punteggio", descending: true)
                .limit(to: 3)
                .getDocuments()
            
            // Converte i documenti in oggetti User
            let fetchedUsers = querySnapshot.documents.compactMap { document -> User? in
                try? document.data(as: User.self)
            }
            
            // Aggiungi la posizione a ciascun utente
            for (index, var user) in fetchedUsers.enumerated() {
                user.posizione = index + 1
            }
            
            // Aggiorna la proprietà @Published per aggiornare la UI
            self.topUsers = fetchedUsers
        } catch {
            print("Errore nel fetch dei top 3 utenti: \(error.localizedDescription)")
        }
    }
}

