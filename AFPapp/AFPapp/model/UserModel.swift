//
//  UserModel.swift
//  Swifty
//
//  Created by Alessio Accardo on 15/02/25.
//

import Foundation
import FirebaseFirestore

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    let username: String
    let email: String
    var punteggio: Int = 0
    var posizione: Int?
    
    var initials: String {

        if username.count >= 2 {
            let firstIndex = username.startIndex
            let secondIndex = username.index(after: firstIndex)

            return "\(username[firstIndex])\(username[secondIndex])"

        } else {
            return username
        }
    }
}

