import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
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
                Button {
                    print("Deleting Account...")
                } label: {
                    SettingRowView(imageName: "xmark.circle.fill",
                                   title: "Delete Account",
                                   tintColor: .red)
                }
            }
        } else {
            NavigationView {
                List {
                    Section {
                        HStack(spacing: 20) {
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 72, height: 72)
                                .foregroundStyle(LinearGradient(colors: [Color(red: 0.984, green: 0.639, blue: 0.239), Color(red: 0.984, green: 0.239, blue: 0.239)], startPoint: .topLeading, endPoint: .bottomTrailing))
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
                    
                    
                    NavigationLink {
                        LoginView2()
                    } label: {
                        SettingRowView(imageName: "arrow.right.circle.fill",
                                       title: "Sign In",
                                       tintColor: .green)
                    }
                }
            }
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
