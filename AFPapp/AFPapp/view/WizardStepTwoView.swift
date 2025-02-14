import SwiftUI

struct WizardStepTwoView: View {
    
    var body: some View {
        VStack() {
            Text("Theory")
                .font(.system(size: 45, weight: .bold))
                .padding(.top, 35)
            Text("\"Learn Swift in the Easy Way\"")
                .font(.system(size: 25, weight: .regular))
                .italic()
                .padding(.bottom, 5)
            VStack() {
                Text("Understand the core concepts with")
                Text("clear and intuitive explanations")
                Text(" ")
                Text(" ")
            }
                .font(.system(size: 20, weight: .light))
                .padding(.bottom, 20)
            Image("Theory")
                .resizable()
                .frame(width: 160, height: 330)
                .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    WizardStepTwoView()
}
