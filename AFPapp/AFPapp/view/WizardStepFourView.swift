import SwiftUI

struct WizardStepFourView: View {
    
    var body: some View {
        VStack() {
            Text("Leaderboard")
                .font(.system(size: 45, weight: .bold))
                .padding(.top, 35)
            Text("\"Climb the ranks!\"")
                .font(.system(size: 25, weight: .regular))
                .italic()
                .padding(.bottom, 5)
            VStack() {
                Text("Test your knowledge, complete")
                Text("challenges and earn points")
                Text("to compete with other learners.")
                Text("Can you reach the top?")
            }
                .font(.system(size: 20, weight: .light))
                .padding(.bottom, 20)
            Image("Leaderboard")
                .resizable()
                .frame(width: 160, height: 330)
                .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    WizardStepFourView()
}
