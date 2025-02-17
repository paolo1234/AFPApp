//
//  TheoryView.swift
//  AFPapp
//
//  Created by Bernardo Macaluso on 15/02/25.
//

import SwiftUI

struct TheoryDataTypesView: View {
    
    var theoryModel: TheoryModel
    
    let numberOfSteps = 8
    
    var body: some View {
        
        Text("Data Types")
            .font(.system(size: 40, weight: .heavy))
            .foregroundColor(backgroundGradientEndColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
        
        switch theoryModel.currentStep {
        case 1: TheoryDataTypesStepOneView()
        case 2: TheoryDataTypesStepTwoView()
        case 3: TheoryDataTypesStepThreeView()
        case 4: TheoryDataTypesStepFourView()
        case 5: TheoryDataTypesStepFiveView()
        case 6: TheoryDataTypesStepSixView()
        case 7: TheoryDataTypesStepSevenView()
        case 8: TheoryDataTypesStepEightView()
        default: EmptyView()
        }
    }
}

struct TheoryDataTypesStepOneView: View {
    var body: some View {
        (Text("Every day, we deal with different kinds of information. Imagine filling out a form: you might enter your name (text), your age (a number), and whether you agree to the terms and conditions (yes or no). In programming, we work with different types of data in a similar way. These are called ") + Text("data types").font(.system(size:28, weight: .semibold)) + Text(", and they indicate what kind of value we are working with."))
    }
}

struct TheoryDataTypesStepTwoView: View {
    var body: some View {
        (Text("The most common data types are:\n") +
         Text("• Int").monospaced().font(.system(size: 25)) + Text(" - Integer numbers like 23, 0, -12 (e.g., the number of apples in your basket)\n") +
         Text("• Double").monospaced().font(.system(size: 25)) + Text(" - Numbers with decimals like 3.14, 0.0, -0.9999 (e.g., the price of an item)\n") +
         Text("• String").monospaced().font(.system(size: 25)) + Text(" - Text strings like \"Hello\", \"Swift is fun!\" (e.g., your name) \n") +
         Text("• Bool").monospaced().font(.system(size: 25)) + Text(" - True or false values (e.g., whenever it is raining or not)\n"))
    }
}

struct TheoryDataTypesStepThreeView: View {
    var body: some View {
        VStack() {
            Text("In Swift, we declare variables or constants with a specific data type:")
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack() {
                VStack() {
                    HStack() {
                        Text("let").foregroundColor(IDE_FF79B2)
                        Text("age").foregroundColor(IDE_4FB0CC)
                        Text(":").foregroundColor(.white)
                        Text("Int").foregroundColor(IDE_DABAFF)
                        Text("=").foregroundColor(.white)
                        Text("25").foregroundColor(IDE_D9C87C)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("// An integer number")
                        .foregroundColor(IDEComment)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 5)
                
                VStack() {
                    HStack() {
                        Text("var").foregroundColor(IDE_FF79B2)
                        Text("price").foregroundColor(IDE_4FB0CC)
                        Text(":").foregroundColor(.white)
                        Text("Double").foregroundColor(IDE_DABAFF)
                        Text("=").foregroundColor(.white)
                        Text("9.99").foregroundColor(IDE_D9C87C)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("// A decimal number")
                        .foregroundColor(IDEComment)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 5)
                
                VStack() {
                    HStack() {
                        Text("let").foregroundColor(IDE_FF79B2)
                        Text("name").foregroundColor(IDE_4FB0CC)
                        Text(":").foregroundColor(.white)
                        Text("String").foregroundColor(IDE_DABAFF)
                        Text("=").foregroundColor(.white)
                        Text("\"Alice\"").foregroundColor(IDE_D9C87C)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("// A piece of text")
                        .foregroundColor(IDEComment)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.bottom, 5)
                
                VStack() {
                    HStack() {
                        Text("var").foregroundColor(IDE_FF79B2)
                        Text("isRaining").foregroundColor(IDE_4FB0CC)
                        Text(":").foregroundColor(.white)
                        Text("Bool").foregroundColor(IDE_DABAFF)
                        Text("=").foregroundColor(.white)
                        Text("false").foregroundColor(IDE_D9C87C)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Text("// A true or false value")
                        .foregroundColor(IDEComment)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
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
                Text("Here's how each part works:").frame(maxWidth: .infinity, alignment: .leading)
                (Text("• let").monospaced().font(.system(size: 25)) + Text(" or ") + Text("var").monospaced().font(.system(size: 25)) + Text(" determines whether the value stays the same (let) or can change (var).")).frame(maxWidth: .infinity, alignment: .leading)
                (Text("• age, price, name, isRaining").monospaced().font(.system(size: 25)) + Text(" are names for our values.")).frame(maxWidth: .infinity, alignment: .leading)
                (Text("• :").monospaced().font(.system(size: 25)) + Text(" followed by ") + Text("Int, Double, String").monospaced().font(.system(size: 25)) + Text(" or ") + Text("Bool").monospaced().font(.system(size: 25)) + Text(" specifies what type of data we are storing")).frame(maxWidth: .infinity, alignment: .leading)
                (Text("• ").monospaced().font(.system(size: 25)) + Text("The") + Text(" = ").monospaced().font(.system(size: 25)) + Text("a value to the variable or constant")).frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

struct TheoryDataTypesStepFourView: View {
    var body: some View {
        (Text("Swift uses a feature called ") + Text("Type Inference").font(.system(size:28, weight: .semibold)) + Text(" which means it can automatically understand the type of a variable or constant without needing to explicitly specify it, based on the value you assign to it."))
            .frame(maxWidth: .infinity, alignment: .leading)
        Text("For example: ")
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            VStack() {
                HStack() {
                    Text("var").foregroundColor(IDE_FF79B2)
                    Text("numberOfApples").foregroundColor(IDE_4FB0CC)
                    Text("=").foregroundColor(.white)
                    Text("5").foregroundColor(IDE_D9C87C)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("// Int").foregroundColor(IDEComment)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, 5)
            
            VStack() {
                HStack() {
                    Text("let").foregroundColor(IDE_FF79B2)
                    Text("temperature").foregroundColor(IDE_4FB0CC)
                    Text("=").foregroundColor(.white)
                    Text("66.70").foregroundColor(IDE_D9C87C)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("// Double").foregroundColor(IDEComment)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, 5)
            
            VStack() {
                HStack() {
                    Text("var").foregroundColor(IDE_FF79B2)
                    Text("greeting").foregroundColor(IDE_4FB0CC)
                    Text("=").foregroundColor(.white)
                    Text("\"Hello\"").foregroundColor(IDE_D9C87C)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("// String").foregroundColor(IDEComment)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, 5)
            
            VStack() {
                HStack() {
                    Text("let").foregroundColor(IDE_FF79B2)
                    Text("swiftIsFun").foregroundColor(IDE_4FB0CC)
                    Text("=").foregroundColor(.white)
                    Text("true").foregroundColor(IDE_D9C87C)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("// Bool").foregroundColor(IDEComment)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .font(.system(size: 18, weight: .medium))
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

struct TheoryDataTypesStepFiveView: View {
    var body: some View {
        (Text("Be careful").font(.system(size:28, weight: .semibold)) + Text(": Swift assigns the type only once, based on the first value. You cannot later assign a different type to the same variable."))
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            VStack() {
                HStack() {
                    Text("var").foregroundColor(IDE_FF79B2)
                    Text("temperature").foregroundColor(IDE_4FB0CC)
                    Text("=").foregroundColor(.white)
                    Text("62").foregroundColor(IDE_D9C87C)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("// Swift infer this as an Int").foregroundColor(IDEComment)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.bottom, 5)
            
            VStack() {
                HStack() {
                    Text("temperature").foregroundColor(IDE_78C2B3)
                    Text("=").foregroundColor(.white)
                    Text("62.0").foregroundColor(IDE_D9C87C)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("// Error! You can’t assign a Double to an Int").foregroundColor(IDEComment)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .font(.system(size: 18, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        Text("If you need to work with decimal values, you should explicitly declare the type as Double:")
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            VStack() {
                (Text("var").foregroundColor(IDE_FF79B2) +
                Text(" temperature").foregroundColor(IDE_4FB0CC) +
                Text(": ").foregroundColor(.white) +
                Text("Double").foregroundColor(IDE_DABAFF) +
                Text(" = ").foregroundColor(.white) +
                Text("62.0").foregroundColor(IDE_D9C87C))
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("// Now it’s a Double, and we can use decimals").foregroundColor(IDEComment)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .font(.system(size: 18, weight: .medium))
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

struct TheoryDataTypesStepSixView: View {
    var body: some View {
        (Text("When learning Swift, it’s useful to see the results of your code. We can do this using the ") + Text("print()").monospaced().font(.system(size: 25)) + Text(" command."))
            .frame(maxWidth: .infinity, alignment: .leading)
        Text("For example:")
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            VStack() {
                HStack() {
                    Text("let").foregroundColor(IDE_FF79B2)
                    Text("temperature").foregroundColor(IDE_4FB0CC)
                    Text("=").foregroundColor(.white)
                    Text("72").foregroundColor(IDE_D9C87C)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                (Text("print ").foregroundColor(IDE_B181EC) +
                 Text("(").foregroundColor(.white) +
                 Text("temperature").foregroundColor(IDE_FF8170) +
                 Text(")").foregroundColor(.white))
                .frame(maxWidth: .infinity, alignment: .leading)
                HStack() {
                    Text("let").foregroundColor(IDE_FF79B2)
                    Text("favoriteColor").foregroundColor(IDE_4FB0CC)
                    Text("=").foregroundColor(.white)
                    Text("\"Blue\"").foregroundColor(IDE_D9C87C)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                (Text("print ").foregroundColor(IDE_B181EC) +
                 Text("(").foregroundColor(.white) +
                 Text("favoriteColor").foregroundColor(IDE_FF8170) +
                 Text(")").foregroundColor(.white))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .font(.system(size: 18, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        Text("This will display:").frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            VStack() {
                Text("72").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
                Text("Blue").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 18, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        (Text("We can also include multiple values in a ") + Text("print()").monospaced().font(.system(size: 25)) + Text(" statement by separating them with commas:"))
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            VStack() {
                (Text("print ").foregroundColor(IDE_B181EC) +
                 Text("(").foregroundColor(.white) +
                 Text("\"today's temperature is\"").foregroundColor(IDE_FF8170) +
                 Text(", ").foregroundColor(.white) +
                 Text("temperature").foregroundColor(IDE_78C2B3) +
                 Text(", ").foregroundColor(.white) +
                 Text("\"degrees.\"").foregroundColor(IDE_FF8170) +
                 Text(")").foregroundColor(.white))
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 18, weight: .medium))
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        .monospaced()
        .background(
            Color(IDEBackground)
        )
        .cornerRadius(10)
        .padding(.vertical, 10)
        
        Text("Output:").frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            VStack() {
                Text("Today's temperature is 72 degrees.").foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .font(.system(size: 18, weight: .medium))
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

struct TheoryDataTypesStepSevenView: View {
    var body: some View {
        Text("In Swift, you can declare a variable by specifying its type without assigning a value immediately.")
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            (Text("var ").foregroundColor(IDE_FF79B2) +
             Text("temperature").foregroundColor(IDE_4FB0CC) +
             Text(": ").foregroundColor(.white) +
             Text("Int").foregroundColor(IDE_DABAFF) +
             Text("\n// Declaring a variable of type Int").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("temperature").foregroundColor(IDE_78C2B3) +
            Text(" = ").foregroundColor(.white) +
            Text("25").foregroundColor(IDE_D9C87C) +
             Text("\n// Assigning a value later").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("temperature").foregroundColor(IDE_FF8170) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: 25").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
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
        
        Text("This can be useful when you want to reserve space for a value that will be assigned later in the program.")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 10)
        
        (Text("Warning!").font(.system(size:28, weight: .semibold)) +
        Text(" If you try to use the variable before assigning it a value, Swift will give you an error."))
        .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            (Text("var ").foregroundColor(IDE_FF79B2) +
             Text("score").foregroundColor(IDE_4FB0CC) +
             Text(": ").foregroundColor(.white) +
             Text("Int").foregroundColor(IDE_DABAFF))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("score").foregroundColor(IDE_FF8170) +
             Text(")").foregroundColor(.white) +
             Text("\n// Error! The variable has no initial value.").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
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

struct TheoryDataTypesStepEightView: View {
    var body: some View {
        Text("Unlike variables, constants must have a value immediately. This is because, once assigned, they cannot be changed.")
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("pi").foregroundColor(IDE_4FB0CC) +
             Text(": ").foregroundColor(.white) +
             Text("Double").foregroundColor(IDE_DABAFF))
            .frame(maxWidth: .infinity, alignment: .leading)
            (Text("pi").foregroundColor(IDE_FF79B2) +
             Text(" = ").foregroundColor(.white) +
             Text("66").foregroundColor(IDE_D9C87C) +
             Text("\n// Error! Constants must be initialized immediately.").foregroundColor(IDEComment))
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
        
        (Text("If you want to use the keyword ") + Text("let").monospaced().font(.system(size: 25)) + Text(", you must assign the value at the time of declaration:"))
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("pi").foregroundColor(IDE_4FB0CC) +
             Text(": ").foregroundColor(.white) +
             Text("Double").foregroundColor(IDE_DABAFF) +
             Text(" = ").foregroundColor(.white) +
             Text("3.14").foregroundColor(IDE_D9C87C) +
             Text("\n// This is correct").foregroundColor(IDEComment))
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
