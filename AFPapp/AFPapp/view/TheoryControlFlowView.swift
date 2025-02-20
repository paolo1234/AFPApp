//
//  TheoryView.swift
//  AFPapp
//
//  Created by Bernardo Macaluso on 15/02/25.
//

import SwiftUI

struct TheoryControlFlowView: View {
    
    var theoryModel: TheoryModel
    
    let numberOfSteps = 9
    
    var body: some View {
        
        Text("Control Flow")
            .font(.system(size: 40, weight: .heavy))
            .foregroundColor(backgroundGradientEndColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
        
        switch theoryModel.currentStep {
        case 1: TheoryControlFlowStepOneView()
        case 2: TheoryControlFlowStepTwoView()
        case 3: TheoryControlFlowStepThreeView()
        case 4: TheoryControlFlowStepFourView()
        case 5: TheoryControlFlowStepFiveView()
        case 6: TheoryControlFlowStepSixView()
        case 7: TheoryControlFlowStepSevenView()
        case 8: TheoryControlFlowStepEightView()
        case 9: TheoryControlFlowStepNineView()
        default: EmptyView()
        }
    }
}

struct TheoryControlFlowStepOneView: View {
    var body: some View {
        (Text("Every day, we make decisions based on conditions:\n") +
         Text("• If it’s ") + Text("cold").font(.system(size: 28, weight: .semibold)) + Text(", we wear a jacket.\n") +
         Text("• If our phone ") + Text("battery is low").font(.system(size: 28, weight: .semibold)) + Text(", we charge it.\n") +
         Text("• If a traffic light is ") + Text("red").font(.system(size: 28, weight: .semibold)) + Text(", we stop; otherwise, we go.\n"))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 5)
        (Text("In programming, we can write code that makes decisions based on certain conditions. In Swift, we use ") + Text("if, if-else, switch").monospaced().font(.system(size: 25)) + Text(" and even a special operator called the ") + Text("ternary operator").font(.system(size: 28, weight: .semibold)) + Text("."))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TheoryControlFlowStepTwoView: View {
    var body: some View {
        (Text("The ") + Text("if").monospaced().font(.system(size: 25)) + Text(" statement allows us to execute a block of code only if a certain condition is true."))
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            Group {
                Text("let ")
                    .foregroundColor(IDE_FF79B2)
                + Text("temperature")
                    .foregroundColor(IDE_4FB0CC)
                + Text(" = ")
                    .foregroundColor(.white)
                + Text("30")
                    .foregroundColor(IDE_D9C87C)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("if ")
                    .foregroundColor(IDE_FF79B2)
                + Text("temperature ")
                    .foregroundColor(IDE_78C2B3)
                + Text("> ")
                    .foregroundColor(.white)
                + Text("25")
                    .foregroundColor(IDE_D9C87C)
                + Text(" {")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("    print")
                    .foregroundColor(IDE_B181EC)
                + Text("(")
                    .foregroundColor(.white)
                + Text("\"It's hot outside!\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("}")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 16, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        VStack() {
            Text("It's hot outside!").foregroundColor(.white)
        }
        .font(.system(size: 20, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        (Text("Note!").font(.system(size: 28, weight: .semibold)) + Text(" If temperature were 20, the code inside the if block would not run."))
    }
}

struct TheoryControlFlowStepThreeView: View {
    
    var body: some View {
        (Text("Sometimes, we want our program to do one thing if a condition is true and another if it’s false."))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
        VStack() {
            Group {
                Text("let ")
                    .foregroundColor(IDE_FF79B2)
                + Text("isRaining")
                    .foregroundColor(IDE_4FB0CC)
                + Text(" = ")
                    .foregroundColor(.white)
                + Text("true")
                    .foregroundColor(IDE_FF79B2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("if ")
                    .foregroundColor(IDE_FF79B2)
                + Text("isRaining")
                    .foregroundColor(IDE_78C2B3)
                + Text(" {")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("    print")
                    .foregroundColor(IDE_B181EC)
                + Text("(")
                    .foregroundColor(.white)
                + Text("\"Take an umbrella!\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("}")
                    .foregroundColor(.white)
                + Text(" else ")
                    .foregroundColor(IDE_FF79B2)
                + Text("{")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("    print")
                    .foregroundColor(IDE_B181EC)
                + Text("(")
                    .foregroundColor(.white)
                + Text("\"Enjoy the sunshine!\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("}")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
         }
         .font(.system(size: 15, weight: .medium))
         .padding(.horizontal, 20)
         .padding(.vertical, 10)
         .frame(maxWidth: .infinity, alignment: .leading)
         .monospaced()
         .background(
         Color(IDEBackground)
         )
         .cornerRadius(10)
         .padding(.vertical, 10)
        
        VStack() {
            Text("Take an umbrella!").foregroundColor(.white)
        }
        .font(.system(size: 20, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
    }
}

struct TheoryControlFlowStepFourView: View {
    var body: some View {
        Text("We can have conditions inside other conditions")
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            Group {
                Text("let ")
                    .foregroundColor(IDE_FF79B2)
                + Text("temperature")
                    .foregroundColor(IDE_4FB0CC)
                + Text(" = ")
                    .foregroundColor(.white)
                + Text("30")
                    .foregroundColor(IDE_D9C87C)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("let ")
                    .foregroundColor(IDE_FF79B2)
                + Text("isSunny")
                    .foregroundColor(IDE_4FB0CC)
                + Text(" = ")
                    .foregroundColor(.white)
                + Text("true")
                    .foregroundColor(IDE_FF79B2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("if ")
                    .foregroundColor(IDE_FF79B2)
                + Text("temperature ")
                    .foregroundColor(IDE_78C2B3)
                + Text("> ")
                    .foregroundColor(.white)
                + Text("25")
                    .foregroundColor(IDE_D9C87C)
                + Text(" {")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("    if ")
                    .foregroundColor(IDE_FF79B2)
                + Text("isSunny")
                    .foregroundColor(IDE_78C2B3)
                + Text(" {")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("        print")
                    .foregroundColor(IDE_B181EC)
                + Text("(")
                    .foregroundColor(.white)
                + Text("\"It's a perfect beach day!\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("    }")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("}")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 18, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        VStack() {
            Text("It's a perfect beach day!").foregroundColor(.white)
        }
        .font(.system(size: 20, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        (Text("Note!").font(.system(size: 28, weight: .semibold)) + Text(" While nesting if statements is possible, it's best to keep your code clear and readable."))
    }
}

struct TheoryControlFlowStepFiveView: View {
    
    var body: some View {
        (Text("Sometimes we need more than two possibilities. In this case we use ") + Text("else if").monospaced().font(.system(size: 25)))
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
    
            (Text("let ")
                .foregroundColor(IDE_FF79B2)
            + Text("temperature")
                .foregroundColor(IDE_4FB0CC)
            + Text(" = ")
                .foregroundStyle(.white)
            + Text("15")
                .foregroundColor(IDE_D9C87C))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("if ")
                .foregroundColor(IDE_FF79B2)
            + Text("temperature ")
                .foregroundColor(IDE_78C2B3)
            + Text("> ")
                .foregroundColor(.white)
            + Text("25")
                .foregroundColor(IDE_D9C87C)
            + Text(" {")
                .foregroundColor(.white))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("    print")
                .foregroundColor(IDE_B181EC)
            + Text("(")
                .foregroundColor(.white)
            + Text("\"It's hot outside!\"")
                .foregroundColor(IDE_FF8170)
            + Text(")")
                .foregroundColor(.white))
            .frame(maxWidth: .infinity, alignment: .leading)
            (Text("}")
                .foregroundColor(.white)
            + Text(" else if ")
                .foregroundColor(IDE_FF79B2)
            + Text("temperature ")
                .foregroundColor(IDE_78C2B3)
            + Text("> ")
                .foregroundColor(.white)
            + Text("15")
                .foregroundColor(IDE_D9C87C)
            + Text(" {")
                .foregroundColor(.white))
            .frame(maxWidth: .infinity, alignment: .leading)
            (Text("    print")
                .foregroundColor(IDE_B181EC)
            + Text("(")
                .foregroundColor(.white)
            + Text("\"It's warm outside.\"")
                .foregroundColor(IDE_FF8170)
            + Text(")")
                .foregroundColor(.white))
            .frame(maxWidth: .infinity, alignment: .leading)
            (Text("}")
                .foregroundColor(.white)
            + Text(" else ")
                .foregroundColor(IDE_FF8170)
            + Text("{\n")
                .foregroundColor(.white)
            + Text("    print")
                .foregroundColor(IDE_B181EC)
            + Text("(")
                .foregroundColor(.white)
            + Text("\"It's cold outside.\"")
                .foregroundColor(IDE_FF8170)
            + Text(")")
                .foregroundColor(.white))
            .frame(maxWidth: .infinity, alignment: .leading)
            Text("}")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 15, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        VStack() {
            Text("It's warm outside.").foregroundColor(.white)
        }
        .font(.system(size: 20, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
    }
}

struct TheoryControlFlowStepSixView: View {
    var body: some View {
        (Text("When there are multiple options, instead of writing many if statements, we use ") + Text("switch").monospaced().font(.system(size: 25)) + Text(". In every day life, for example, we can consider that if it’s:"))
            .frame(maxWidth: .infinity, alignment: .leading)
        
        (Text("• Monday ").font(.system(size: 28, weight: .semibold)) + Text(" → It’s the start of the week\n") +
         Text("• Friday ").font(.system(size: 28, weight: .semibold)) + Text(" → Weekend is near\n") +
         Text("• Saturday ").font(.system(size: 28, weight: .semibold)) + Text(" → It's the weekend\n") +
         Text("• Otherwise ").font(.system(size: 28, weight: .semibold)) + Text(" → It's a normal day\n"))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 5)
    }
}

struct TheoryControlFlowStepSevenView: View {
    
    var body: some View {
        Text("Let’s see in Swift how we can identify, for example, a type of vehicle:")
        
        VStack() {
            Group {
                Text("let ")
                    .foregroundColor(IDE_FF79B2)
                + Text("numberOfWheels")
                    .foregroundColor(IDE_4FB0CC)
                + Text(" = ")
                    .foregroundColor(.white)
                + Text("2")
                    .foregroundColor(IDE_D9C87C)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("switch ")
                    .foregroundColor(IDE_FF79B2)
                + Text("numberOfWheels ")
                    .foregroundColor(IDE_78C2B3)
                + Text("{")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("case ")
                    .foregroundColor(IDE_FF79B2)
                + Text("0:")
                    .foregroundColor(.white)
                + Text("    print(")
                    .foregroundColor(.white)
                + Text("\"Missing something?\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("case ")
                    .foregroundColor(IDE_FF79B2)
                + Text("1:")
                    .foregroundColor(.white)
                + Text("    print(")
                    .foregroundColor(.white)
                + Text("\"Unicycle\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("case ")
                    .foregroundColor(IDE_FF79B2)
                + Text("2:")
                    .foregroundColor(.white)
                + Text("    print(")
                    .foregroundColor(.white)
                + Text("\"Bicycle\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("case ")
                    .foregroundColor(IDE_FF79B2)
                + Text("3:")
                    .foregroundColor(.white)
                + Text("    print(")
                    .foregroundColor(.white)
                + Text("\"Tricycle\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Group {
                Text("case ")
                    .foregroundColor(IDE_FF79B2)
                + Text("0:")
                    .foregroundColor(.white)
                + Text("    print(")
                    .foregroundColor(.white)
                + Text("\"Quadcycle\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("default")
                    .foregroundColor(IDE_FF79B2)
                + Text(": ")
                    .foregroundColor(.white)
                + Text("    print")
                    .foregroundColor(.white)
                + Text("(")
                    .foregroundColor(.white)
                + Text("\"That's a lot of wheels!\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("}")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 14, weight: .medium))
        .padding(.leading, 20)
        .padding(.vertical, 10)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        VStack() {
            Text("Bicycle").foregroundColor(.white)
        }
        .font(.system(size: 20, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        (Text("Note!").font(.system(size: 28, weight: .semibold)) + Text(" if you want to consider two or more values included in the same case, you can use a comma in-between two values. Example:"))
        
        VStack() {
            Text("case \"Saturday\", \"Sunday\":").foregroundColor(.white)
        }
        .font(.system(size: 18, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
    }
}

struct TheoryControlFlowStepEightView: View {
    var body: some View {
        Text("We can check if a value falls within a range. For example, in real life we can state that if a movie is:")
            .frame(maxWidth: .infinity, alignment: .leading)
        (Text("• Less than 60 minutes ").font(.system(size: 28, weight: .semibold)) + Text(" → It’s a short film.\n") +
         Text("• Between 60 and 120 minutes ").font(.system(size: 28, weight: .semibold)) + Text(" → It's a standard movie.\n") +
         Text("• More than 120 minutes ").font(.system(size: 28, weight: .semibold)) + Text(" → It's a long movie.\n"))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 5)
        
        Text("Let's see in Swift how we can determine a travel distance")
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            Group {
                Text("let ")
                    .foregroundColor(IDE_FF79B2)
                + Text("distance")
                    .foregroundColor(IDE_78C2B3)
                + Text(" = ")
                    .foregroundColor(.white)
                + Text("50")
                    .foregroundColor(IDE_D9C87C)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("switch ")
                    .foregroundColor(IDE_FF79B2)
                + Text("distance ")
                    .foregroundColor(IDE_78C2B3)
                + Text("{")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("case ")
                    .foregroundColor(IDE_FF79B2)
                + Text("0...9:")
                    .foregroundColor(.white)
                + Text("\nprint(")
                    .foregroundColor(.white)
                + Text("\"Your destination is close.\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")\n")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("case ")
                    .foregroundColor(IDE_FF79B2)
                + Text("10...99:")
                    .foregroundColor(.white)
                + Text("\nprint(")
                    .foregroundColor(.white)
                + Text("\"Your destination is a medium distance from here\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")\n")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("case ")
                    .foregroundColor(IDE_FF79B2)
                + Text("100...999:")
                    .foregroundColor(.white)
                + Text("\nprint(")
                    .foregroundColor(.white)
                + Text("\"Your destination is far from here.\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")\n")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Group {
                Text("default:")
                    .foregroundColor(IDE_FF79B2)
                + Text("\nprint(")
                    .foregroundColor(.white)
                + Text("\"Are you sure you want to travel this far?\"")
                    .foregroundColor(IDE_FF8170)
                + Text(")")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("}")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 18, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        VStack() {
            Text("Your destination is a medium distance from here.")
                .foregroundColor(.white)
        }
        .font(.system(size: 20, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
    }
}

struct TheoryControlFlowStepNineView: View {
    
    var body: some View {
        (Text("Instead of writing a long") + Text("if-else").monospaced().font(.system(size: 25)) + Text(", we can ") + Text("simplify").font(.system(size: 28, weight: .semibold)) + Text(" conditions using ") + Text("?:").font(.system(size: 28, weight: .semibold)) + Text(" . In real life, for example:"))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
        (Text("Are you hungry") + Text("?").font(.system(size: 28, weight: .semibold)) + Text(" Eat. Otherwise (") + Text(":").font(.system(size: 28, weight: .semibold)) + Text("), drink water."))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
        (Text("An easy example in Swift could be finding the largest number:"))
            .frame(maxWidth: .infinity, alignment: .leading)
        
        VStack() {
            Text("let a = 15")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("let b = 4")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("let largest = (a > b) ? a : b")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)

            Text("print(\"The largest number is \\(largest).\")")
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 17, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
    }
}
