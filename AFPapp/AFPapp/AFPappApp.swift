//
//  AFPappApp.swift
//  AFPapp
//
//  Created by Paolo Calamia on 10/02/25.
//

import SwiftUI
import Firebase

@main
struct AFPappApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
