import SwiftUI

let backgroundGradientStartColor: Color = Color(red: 0.984, green: 0.639, blue: 0.239)
let backgroundGradientEndColor: Color = Color(red: 1.000, green: 0.255, blue: 0.161)

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var isDarkMode: Bool = false
    @State private var wizardShown = UserDefaults.standard.bool(forKey: "wizardShown")
    
    var body: some View {
        if wizardShown {
            TabView {
                HomeView()
                     .tabItem {
                     Image(systemName: "book.fill")
                     Text("Home")
                     
                     }
                if let user = viewModel.currentUser {
                    LeaderboardView()
                        .tabItem {
                            Image(systemName: "crown.fill")
                            Text("Leaderboards")
                        }
                }
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.circle.fill")
                        Text("Profile")
                    }
            }
            
            // FOR TEST PURPOSES
            /* Button("Reset") {
                UserDefaults.standard.removeObject(forKey: "wizardShown")
            } */
            
            /* Button("Reset Theory") {
                vmTheory.resetTheoryProgress()
            } */
            
            .onAppear() {
                UITabBar.appearance().backgroundColor = .white.withAlphaComponent(0.8)
            }
            .accentColor(backgroundGradientEndColor)
            .background(Color.white.opacity(0.5).edgesIgnoringSafeArea(.all))
        } else {
            WizardView {
                self.wizardShown = true
                UserDefaults.standard.set(true, forKey: "wizardShown")
            }
        }
    }
}



#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
