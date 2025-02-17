import SwiftUI

// private let backgroundGradientStartColor: Color = Color(red: 0.984, green: 0.639, blue: 0.239)
// private let backgroundGradientEndColor: Color = Color(red: 1.000, green: 0.255, blue: 0.161)

struct WizardView: View {
    @State private var currentStep: Int = 0
    var onComplete: () -> Void
    
    var body: some View {
        VStack {
            switch currentStep {
                case 0: WizardWelcomeView()
                case 1: WizardStepOneView()
                case 2: WizardStepTwoView()
                case 3: WizardStepThreeView()
                case 4: WizardStepFourView()
                case 5: WizardCompletedView()
                default: ContentView()
            }
            if (currentStep != 0 && currentStep != 6) {
                if(currentStep != 5) {
                    HStack(spacing: 11) {
                        ForEach(0..<4, id: \.self) { index in
                            Circle()
                                .fill(index == (currentStep - 1) ? Color.white : Color.gray.opacity(0.7))
                                .frame(width: 10, height: 10)
                        }
                    }
                    .padding(.bottom, 30)
                }
                
                Button(action: {currentStep != 5 ? currentStep += 1 : onComplete()}) {
                    ZStack() {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 150, height: 50)
                            .foregroundColor(.white)
                        if (currentStep != 5) {
                            Text("Next")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.black)
                        } else {
                            Text("Let's go!")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(.black)
                        }
                    }
                }
                Spacer()
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .onTapGesture {
            if currentStep == 0 {
                currentStep += 1
            }
        }
        .statusBar(hidden: true)
        .foregroundColor(.white)
    }
}

#Preview {
    WizardView(onComplete:{})
}
