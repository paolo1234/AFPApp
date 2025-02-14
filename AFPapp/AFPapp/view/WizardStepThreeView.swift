import SwiftUI

struct WizardStepThreeView: View {
    
    var body: some View {
        VStack() {
            Text("Practice")
                .font(.system(size: 45, weight: .bold))
                .padding(.top, 35)
            Text("\"Code, Run, Improve\"")
                .font(.system(size: 25, weight: .regular))
                .italic()
                .padding(.bottom, 5)
            VStack() {
                Text("It’s not just about theory!")
                Text("Practice directly in the app with")
                Text("interactive challenges and quizzes to")
                Text("reinforce your skills.")
            }
                .font(.system(size: 20, weight: .light))
                .padding(.bottom, 20)
            Image("Quiz")
                .resizable()
                .frame(width: 160, height: 330)
                .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    WizardStepThreeView()
}
