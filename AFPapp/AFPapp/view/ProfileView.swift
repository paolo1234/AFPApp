import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
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
            .navigationTitle("Profile")
        }
    }
}

// MARK: - Sezioni per Utente Registrato

extension ProfileView {
    
    private func userProfileSection(user: User) -> some View {
        Section {
            HStack(spacing: 20) {
                Text(user.initials)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 72, height: 72)
                    .background(Color(.systemGray3))
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.username)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 4)
                    
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
                print("Deleting Account...")
            } label: {
                SettingRowView(imageName: "xmark.circle.fill",
                               title: "Delete Account",
                               tintColor: .red)
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
                    Text("User")
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
                // Implementa qui l'azione di reset.
                QuizModel.resetQuizProgress(filename: "varconstdata")
                QuizModel.resetQuizProgress(filename: "strings")
                QuizModel.resetQuizProgress(filename: "control_flow")
            } label: {
                SettingRowView(imageName: "arrow.clockwise.circle.fill",
                               title: "Reset",
                               tintColor: .red)
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
