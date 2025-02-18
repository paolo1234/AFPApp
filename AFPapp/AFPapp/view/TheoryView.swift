//
//  TheoryView.swift
//  AFPapp
//
//  Created by Bernardo Macaluso on 14/02/25.
//

import SwiftUI

// PER GLI ESEMPI DI CODICE
let IDEBackground: Color = Color(red: 0.161, green: 0.165, blue: 0.184)
let IDEComment: Color = Color(red: 0.494, green: 0.549, blue: 0.596)
let IDE_FF79B2: Color = Color(red: 1, green: 0.475, blue: 0.698)
let IDE_4FB0CC: Color = Color(red: 0.31, green: 0.69, blue: 0.8)
let IDE_DABAFF: Color = Color(red: 0.855, green: 0.729, blue: 1)
let IDE_ACF2E4: Color = Color(red: 0.675, green: 0.949, blue: 0.894)
let IDE_78C2B3: Color = Color(red: 0.471, green: 0.761, blue: 0.702)
let IDE_D9C87C: Color = Color(red: 0.851, green: 0.784, blue: 0.486)
let IDE_B181EC: Color = Color(red: 0.694, green: 0.506, blue: 0.925)
let IDE_FF8170: Color = Color(red: 1, green: 0.506, blue: 0.439)

struct TheoryView: View {
    
    @Binding var lessonID: Int
    @State private var endLesson = false
    @EnvironmentObject private var vmTheory: TheoryViewModel
    
    
    func returnNumberOfSteps() -> Int {
        let numberOfSteps: Int
        switch lessonID {
        case 1: numberOfSteps = TheoryConstantsAndVariablesView(theoryModel: vmTheory.theoryList[lessonID - 1]).numberOfSteps
        case 2: numberOfSteps = TheoryDataTypesView(theoryModel: vmTheory.theoryList[lessonID - 1]).numberOfSteps
        case 3: numberOfSteps = TheoryOperatorsView(theoryModel: vmTheory.theoryList[lessonID - 1]).numberOfSteps
        default: numberOfSteps = 1
        }
        return numberOfSteps
    }
    
    var body: some View {
        
        VStack() {
            
            switch endLesson {
                
            case false:
                VStack() {
                    ScrollView() {
                        VStack() {
                            switch lessonID {
                            case 1: TheoryConstantsAndVariablesView(theoryModel: vmTheory.theoryList[lessonID - 1])
                            case 2: TheoryDataTypesView(theoryModel: vmTheory.theoryList[lessonID - 1])
                            case 3: TheoryOperatorsView(theoryModel: vmTheory.theoryList[lessonID - 1])
                            default: EmptyView()
                            }
                        }
                        .font(.system(size: 28, weight: .light))
                        .padding(.vertical, 10)
                        .foregroundColor(.black)
                        .lineSpacing(4)
                        .cornerRadius(20)
                    }
                    
                    Spacer()
                    
                    if (vmTheory.theoryList[lessonID - 1].currentStep != returnNumberOfSteps() + 1) {
                        HStack(spacing: 11) {
                            ForEach(0..<returnNumberOfSteps(), id: \.self) { index in
                                Circle()
                                    .fill(index == (vmTheory.theoryList[lessonID - 1].currentStep - 1) ? Color.black : Color.gray.opacity(0.7))
                                    .frame(width: 10, height: 10)
                            }
                        }
                        .padding(.vertical, 30)
                        
                        HStack {
                            
                            if (vmTheory.theoryList[lessonID - 1].currentStep != 1) {
                                Button(action: {
                                    vmTheory.updateCurrentStep(lessonID: lessonID, add: false, sub: true, numberOfSteps: returnNumberOfSteps())
                                }) {
                                    Text("Back")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                        .frame(width: 120, height: 50)
                                        .background(LinearGradient(colors: [Color(red: 1, green: 0.255, blue: 0.161), Color(red: 0.984, green: 0.639, blue: 0.239)], startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(20)
                                }
                            }
                            
                            Spacer()
                            
                            if (vmTheory.theoryList[lessonID - 1].currentStep != returnNumberOfSteps()) {
                                Button(action: {
                                    vmTheory.updateCurrentStep(lessonID: lessonID, add: true, sub: false, numberOfSteps: returnNumberOfSteps())
                                }) {
                                    Text("Next")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                        .frame(width: 120, height: 50)
                                        .background(LinearGradient(colors: [Color(red: 1, green: 0.255, blue: 0.161), Color(red: 0.984, green: 0.639, blue: 0.239)], startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(20)
                                }
                            } else {
                                Button(action: {endLesson = true}) {
                                    Text("End")
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.white)
                                        .frame(width: 120, height: 50)
                                        .background(LinearGradient(colors: [Color(red: 1, green: 0.255, blue: 0.161), Color(red: 0.984, green: 0.639, blue: 0.239)], startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(20)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
                .tint(.orange)
                
            case true:
                ChooseView()                
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
}

struct FailView: View {
    @Binding var currentStep: Int
    var body: some View {
        Text("Something went wrong!")
    }
}


