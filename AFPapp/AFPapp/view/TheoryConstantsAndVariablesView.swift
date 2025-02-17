//
//  TheoryView.swift
//  AFPapp
//
//  Created by Bernardo Macaluso on 15/02/25.
//

import SwiftUI

struct TheoryConstantsAndVariablesView: View {
    
    var theoryModel: TheoryModel
    
    let numberOfSteps = 10
    
    var body: some View {
        
        if (theoryModel.currentStep <= 5) {
            Text("Constants")
                .font(.system(size: 40, weight: .heavy))
                .foregroundColor(backgroundGradientEndColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
        } else {
            Text("Variables")
                .font(.system(size: 40, weight: .heavy))
                .foregroundColor(backgroundGradientEndColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
        }
        
        switch theoryModel.currentStep {
        case 1: TheoryConstantsAndVariablesStepOneView()
        case 2: TheoryConstantsAndVariablesStepTwoView()
        case 3: TheoryConstantsAndVariablesStepThreeView()
        case 4: TheoryConstantsAndVariablesStepFourView()
        case 5: TheoryConstantsAndVariablesStepFiveView()
        case 6: TheoryConstantsAndVariablesStepSixView()
        case 7: TheoryConstantsAndVariablesStepSevenView()
        case 8: TheoryConstantsAndVariablesStepEightView()
        case 9: TheoryConstantsAndVariablesStepNineView()
        case 10: TheoryConstantsAndVariablesStepTenView()
        default: EmptyView()
        }
    }
}

struct TheoryConstantsAndVariablesStepOneView: View {
    var body: some View {
        (Text("Some things in life always stay the same. For example, think about the number of days in a week - it is always 7.\nIn programming, we use") +
         Text(" constants ").font(.system(size: 28, weight: .semibold)) +
         Text("to represent unchanging values like this, things that remain the same throughout the entire program."))
    }
}

struct TheoryConstantsAndVariablesStepTwoView: View {
    var body: some View {
        Text("We can write this to represent the number of days in a week:")
        (Text("let ").foregroundColor(IDE_FF79B2) +
         Text("daysInWeek").foregroundColor(IDE_4FB0CC) +
         Text(" = ").foregroundColor(.white) +
         Text("7").foregroundColor(IDE_D9C87C))
        .font(.system(size: 20, weight: .medium))
        .padding(.leading, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        (Text("Let's break this down:\n") +
         Text("• let ").monospaced().font(.system(size: 25)) + Text("means we are creating a costant\n") +
         Text("• daysInWeek ").monospaced().font(.system(size: 25)) + Text("is the name of the constant\n") +
         Text("• = ").monospaced().font(.system(size: 25)) + Text("is the symbol we use to assign a value to the constant\n") +
         Text("• 7 ").monospaced().font(.system(size: 25)) + Text("is the value we assign to the constant\n"))
    }
}

struct TheoryConstantsAndVariablesStepThreeView: View {
    var body: some View {
        VStack() {
            Text("Other examples of constants in our everyday life might be the number of hours in a day (24) and the number of months in a year (12):")
            VStack() {
                (Text("let ").foregroundColor(IDE_FF79B2) +
                 Text("hoursInDay").foregroundColor(IDE_4FB0CC) +
                 Text(" = ").foregroundColor(.white) +
                 Text("24").foregroundColor(IDE_D9C87C))
                .frame(maxWidth: .infinity, alignment: .leading)
                (Text("let ").foregroundColor(IDE_FF79B2) +
                 Text("monthsInYear").foregroundColor(IDE_4FB0CC) +
                 Text(" = ").foregroundColor(.white) +
                 Text("12").foregroundColor(IDE_D9C87C))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .font(.system(size: 20, weight: .medium))
            .padding(.leading, 20)
            .padding(.vertical, 10)
            .monospaced()
            .background(
                Color(IDEBackground)
            )
            .cornerRadius(10)
            .padding(.vertical, 10)
        }
    }
}

struct TheoryConstantsAndVariablesStepFourView: View {
    var body: some View {
        Text("Imagine now trying to change the days of the week from 7 to 8 — it's impossible! Similarly, in programming, if we try to modify a constant, we'll get an error. For example:")
        (Text("daysInWeek").foregroundColor(IDE_78C2B3) +
         Text(" = ").foregroundColor(.white) +
         Text("8").foregroundColor(IDE_D9C87C) +
         Text(" // Error!").foregroundColor(IDEComment))
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 20, weight: .medium))
        .padding(.leading, 20)
        .padding(.vertical, 10)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
    }
}

struct TheoryConstantsAndVariablesStepFiveView: View {
    var body: some View {
        (Text("Important").font(.system(size:28, weight: .semibold)) + Text(": the ") + Text("let").monospaced().font(.system(size: 25)) + Text(" keyword is used only once we create each constant for the first time and assign it a value. After that, we cannot change it."))
    }
}

struct TheoryConstantsAndVariablesStepSixView: View {
    var body: some View {
        (Text("Many things in life change over time. For example, think about the temperature in your city. In the morning, it might be 59°F, but by noon, it could rise to 77°F, and then drop again in the evening. In programming, we represent values that can change using") +
         Text(" variables").font(.system(size: 28, weight: .semibold)) +
         Text("."))
    }
}

struct TheoryConstantsAndVariablesStepSevenView: View {
    var body: some View {
        Text("Here's how we can represent the outside temperature:")
        (Text("var ").foregroundColor(IDE_FF79B2) +
         Text("temperature").foregroundColor(IDE_4FB0CC) +
         Text(" = ").foregroundColor(.white) +
         Text("59").foregroundColor(IDE_D9C87C))
        .font(.system(size: 20, weight: .medium))
        .padding(.leading, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        (Text("Let's break this down:\n") +
         Text("• var ").monospaced().font(.system(size: 25)) + Text("means we are creating a variable\n") +
         Text("• temperature ").monospaced().font(.system(size: 25)) + Text("is the name of the constant\n") +
         Text("• = ").monospaced().font(.system(size: 25)) + Text("is the symbol we use to assign a value to the variable\n") +
         Text("• 7 ").monospaced().font(.system(size: 25)) + Text("is the value we assign to the variable\n"))
    }
}

struct TheoryConstantsAndVariablesStepEightView: View {
    var body: some View {
        Text("Other real-life examples of variables might include the number of steps you take in a day, or your phone’s battery level — all of these can change:")
        VStack() {
            (Text("var ").foregroundColor(IDE_FF79B2) +
             Text("numberOfSteps").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("1251").foregroundColor(IDE_D9C87C))
            .frame(maxWidth: .infinity, alignment: .leading)
            (Text("var ").foregroundColor(IDE_FF79B2) +
             Text("batteryLevel").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("66").foregroundColor(IDE_D9C87C))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 20, weight: .medium))
        .padding(.leading, 20)
        .padding(.vertical, 10)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
    }
}

struct TheoryConstantsAndVariablesStepNineView: View {
    var body: some View {
        Text("Since a variable can change, we can update its value at any time:")
        VStack() {
            (Text("temperature").foregroundColor(IDE_78C2B3) +
             Text(" = ").foregroundColor(.white) +
             Text("77").foregroundColor(IDE_D9C87C) +
             Text(" // The temperature has increased").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 10)
            (Text("temperature").foregroundColor(IDE_78C2B3) +
             Text(" = ").foregroundColor(.white) +
             Text("61").foregroundColor(IDE_D9C87C) +
             Text(" // The temperature has dropped").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 20, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
    }
}

struct TheoryConstantsAndVariablesStepTenView: View {
    var body: some View {
        (Text("Important").font(.system(size:28, weight: .semibold)) + Text(": we use ") + Text("var").monospaced().font(.system(size: 25)) + Text(" only when we create a variable. After that, we can change without using it again."))
    }
}
