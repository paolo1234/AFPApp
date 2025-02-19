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
    
    func listenToTop3Users() {
        Firestore.firestore()
            .collection("users")
            .order(by: "punteggio", descending: true)
            .limit(to: 3)
            .addSnapshotListener { [weak self] snapshot, error in
                guard let self = self else { return }
                if let error = error {
                    print("Errore nel listener della classifica: \(error.localizedDescription)")
                    return
                }
                
                guard let documents = snapshot?.documents else { return }
                
                let fetchedUsers = documents.enumerated().compactMap { (index, document) -> User? in
                    var user = try? document.data(as: User.self)
                    user?.posizione = index + 1  // Assegniamo la posizione
                    return user
                }
                
                self.topUsers = fetchedUsers
            }
    }
}
