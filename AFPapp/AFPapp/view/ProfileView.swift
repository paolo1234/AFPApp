import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject private var vmTheory: TheoryViewModel = .init()
    @State private var showDeleteAlert = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        NavigationView {
            List {
                if let user = viewModel.currentUser {
                    userProfileSection(user: user)
                    signOutSection
                    deleteAccountSection
                } else {
                    guestProfileSection
                    loginLinkSection
                }
                resetSection
            }
            .listStyle(GroupedListStyle())
            .scrollContentBackground(.hidden)
            .background(
                LinearGradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
            .navigationTitle("Profile")
        }
    }
}

// MARK: - Sezioni per Utente Registrato

extension ProfileView {
    
    private func userProfileSection(user: User) -> some View {
        Section {
            HStack(spacing: 20) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 72, height: 72)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color(red: 0.984, green: 0.639, blue: 0.239),
                                Color(red: 0.984, green: 0.239, blue: 0.239)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .center) {
                        Text(user.username)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.bottom, 4)
                        
                        Spacer()
                        
                        Image(systemName: "star.circle.fill")
                            .font(.system(size: 20))
                            .foregroundStyle(Color.orange)
                        
                        Text("\(user.punteggio)")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }
                    Text(user.email)
                        .font(.title3)
                        .foregroundStyle(.black)
                }
            }
        }
        .frame(height: 100)
    }
    
    private var signOutSection: some View {
        Section {
            Button {
                Task {
                    do {
                        try await viewModel.signOut()
                    } catch {
                        print("Errore durante il logout: \(error.localizedDescription)")
                    }
                }
            } label: {
                SettingRowView(imageName: "arrow.left.circle.fill",
                               title: "Sign Out",
                               tintColor: .red)
            }
        }
    }
    
    private var deleteAccountSection: some View {
        Section {
            Button {
                showDeleteAlert = true
            } label: {
                SettingRowView(imageName: "xmark.circle.fill",
                               title: "Delete Account",
                               tintColor: .red)
            }
            .foregroundStyle(.red)
            .alert("Confirm Deletion", isPresented: $showDeleteAlert) {
                Button("Delete", role: .destructive) {
                    Task {
                        do {
                            try await viewModel.deleteAccount()
                        } catch {
                            errorMessage = error.localizedDescription
                        }
                    }
                }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Are you sure you want to delete your account? This action is irreversible.")
            }
            
            if let errorMessage = errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
            }
        }
    }
}

// MARK: - Sezioni per Utente Ospite

extension ProfileView {
    
    private var guestProfileSection: some View {
        Section {
            HStack(spacing: 20) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 72, height: 72)
                    .foregroundStyle(
                        LinearGradient(
                            colors: [
                                Color(red: 0.984, green: 0.639, blue: 0.239),
                                Color(red: 0.984, green: 0.239, blue: 0.239)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("You")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 4)
                }
            }
        }
        .frame(height: 100)
    }
    
    private var loginLinkSection: some View {
        Section {
            NavigationLink {
                LoginView()
            } label: {
                SettingRowView(imageName: "arrow.right.circle.fill",
                               title: "Sign In",
                               tintColor: .green)
            }
        }
    }
}

// MARK: - Sezione Reset (visibile in entrambi i casi)

extension ProfileView {
    
    private var resetSection: some View {
        Section {
            Button {
                QuizModel.resetQuizProgress(filename: "control_flow")
                QuizModel.resetQuizProgress(filename: "strings")
                QuizModel.resetQuizProgress(filename: "varconstdata")
                UserDefaults.standard.removeObject(forKey: "wizardShown")
                vmTheory.resetTheoryProgress()
            } label: {
                SettingRowView(imageName: "arrow.counterclockwise.circle",
                               title: "Reset Account",
                               tintColor: .black)
            }
        }
    }
}

// MARK: - SettingRowView

struct SettingRowView: View {
    
    let imageName: String
    let title: String
    let tintColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundColor(tintColor)
            
            Text(title)
                .font(.system(size: 18))
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
}
