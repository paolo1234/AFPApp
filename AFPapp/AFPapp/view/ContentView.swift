import SwiftUI

struct ContentView: View {
    
    @State var isDarkMode: Bool = false
    
    var body: some View {
        
        VStack {
            Text("Home")
                .font(.system(size: 30, weight: .medium))
                .foregroundColor(Color.white)
                .padding(.top)
            
            HomeView()
        }
        .background(Color(red: 0.125, green: 0.302, blue: 0.392))
    }
}



#Preview {
    ContentView()
}
