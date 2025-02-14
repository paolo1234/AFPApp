import SwiftUI

struct WizardStepOneView: View {
    
    var body: some View {
        VStack() {
            Text("Lessons")
                .font(.system(size: 45, weight: .bold))
                .padding(.top, 35)
            Text(" ")
                .font(.system(size: 25, weight: .regular))
                .italic()
                .padding(.bottom, 5)
            VStack() {
                Text("In this section you can")
                Text("choose the arguments")
                Text(" ")
                Text(" ")
            }
                .font(.system(size: 20, weight: .light))
                .padding(.bottom, 20)
            Image("Lessons")
                .resizable()
                .frame(width: 160, height: 330)
                .padding(.bottom, 40)
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
    }
}

#Preview {
    WizardStepOneView()
}
