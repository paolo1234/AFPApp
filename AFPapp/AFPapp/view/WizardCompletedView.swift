import SwiftUI

struct WizardCompletedView: View {
    
    var body: some View {
        VStack() {
            Text("Setup complete")
                .font(.system(size: 45, weight: .bold))
                .padding(.bottom, 20)
                .padding(.top, 70)
                Text("You may now continue \nto the main page. Have fun!")
                    .font(.system(size: 25, weight: .light))
                    .padding(.bottom, 300)
                    .padding(.bottom, 30)
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    WizardCompletedView()
}
