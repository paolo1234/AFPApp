import SwiftUI

struct WizardWelcomeView: View {
    
    var body: some View {
        VStack() {
            Text("Welcome to \nSwifty")
                .font(.system(size: 45, weight: .bold))
                .padding(.bottom, 20)
                .padding(.top, 70)
            VStack() {
                Text("Tap anywhere on the")
                Text("to continue")
            }
                .font(.system(size: 25, weight: .light))
                .padding(.bottom, 300)
            Image("transparent-logo")
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    WizardWelcomeView()
}
