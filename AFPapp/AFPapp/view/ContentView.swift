import SwiftUI

struct ContentView: View {
    
    @State var isDarkMode: Bool = false
    @State private var wizardShown = UserDefaults.standard.bool(forKey: "wizardShown")
    let backgroundGradientStartColor: Color = Color(red: 0.984, green: 0.639, blue: 0.239)
    let backgroundGradientEndColor: Color = Color(red: 1.000, green: 0.255, blue: 0.161)
    
    var body: some View {
        if wizardShown {
            TabView {
                HomeView()
                     .tabItem {
                     Image(systemName: "book.fill")
                     Text("Home")
                     
                     }
                LeaderboardView()
                    .tabItem {
                        Image(systemName: "crown.fill")
                        Text("Leaderboards")
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
}
