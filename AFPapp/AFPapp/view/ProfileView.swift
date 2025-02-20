import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if viewModel.currentUser != nil {
            UserLoggedIn()
        } else {
            GuestUser()
        }
    }
}


struct GuestUser: View {
    
    @StateObject private var vmTheory: TheoryViewModel = .init()
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Profile")
                    .font(.system(size: 40, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                List {
                    Section {
                        HStack(spacing: 20) {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 72, height: 72)
                                .foregroundStyle(LinearGradient(colors: [Color(red: 0.984, green: 0.639, blue: 0.239),
                                                                         Color(red: 0.984, green: 0.239, blue: 0.239)],
                                                                startPoint: .topLeading,
                                                                endPoint: .bottomTrailing))
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
                    
                    
                    NavigationLink {
                        LoginView()
                    } label: {
                        SettingRowView(imageName: "arrow.right.circle.fill",
                                       title: "Sign In",
                                       tintColor: .green)
                    }
                    
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
            .scrollContentBackground(.hidden)
            .background(LinearGradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor],
                                       startPoint: .bottomTrailing,
                                       endPoint: .topLeading))
        }
    }
}




struct UserLoggedIn: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject private var vmTheory: TheoryViewModel = .init()
    @State private var showDeleteAlert = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        
        if let user = viewModel.currentUser {
            VStack {
                Text("Profile")
                    .font(.system(size: 40, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                List {
                    Section {
                        HStack(spacing: 20) {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 72, height: 72)
                                .foregroundStyle(LinearGradient(colors:
                                                                    [Color(red: 0.984,
                                                                           green: 0.639,
                                                                           blue: 0.239),
                                                                     Color(red: 0.984,
                                                                           green: 0.239,
                                                                           blue: 0.239)],
                                                                startPoint: .topLeading,
                                                                endPoint: .bottomTrailing))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 4) {
                                HStack(alignment: .center){
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
                        
                        Button {
                                QuizModel.resetQuizProgress(filename: "control_flow")
                                QuizModel.resetQuizProgress(filename: "strings")
                                QuizModel.resetQuizProgress(filename: "varconstdata")
                                UserDefaults.standard.removeObject(forKey: "wizardShown")
                                vmTheory.resetTheoryProgress()
                            Task {
                                await viewModel.resetPunteggio()
                                await viewModel.fetchUser()
                            }
                            } label: {
                                SettingRowView(imageName: "arrow.counterclockwise.circle",
                                               title: "Reset Account",
                                               tintColor: .black)
                            }

                        
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(LinearGradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor],
                                       startPoint: .bottomTrailing,
                                       endPoint: .topLeading))
        }
    }
}


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
