//
//  TheoryView.swift
//  AFPapp
//
//  Created by Bernardo Macaluso on 15/02/25.
//

import SwiftUI

struct TheoryOperatorsView: View {
    
    var theoryModel: TheoryModel
    
    let numberOfSteps = 10
    
    var body: some View {
        
        Text("Operators")
            .font(.system(size: 40, weight: .heavy))
            .foregroundColor(backgroundGradientEndColor)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
        
        switch theoryModel.currentStep {
        case 1: TheoryOperatorsViewStepOneView()
        case 2: TheoryOperatorsViewStepTwoView()
        case 3: TheoryOperatorsViewStepThreeView()
        case 4: TheoryOperatorsViewStepFourView()
        case 5: TheoryOperatorsViewStepFiveView()
        case 6: TheoryOperatorsViewStepSixView()
        case 7: TheoryOperatorsViewStepSevenView()
        case 8: TheoryOperatorsViewStepEightView()
        case 9: TheoryOperatorsViewStepNineView()
        case 10: TheoryOperatorsViewStepTenView()
        default: EmptyView()
        }
    }
}

struct TheoryOperatorsViewStepOneView: View {
    var body: some View {
        (Text("Every day, we compare, add, subtract, and make decisions based on values. Imagine you're shopping:\n") +
         Text("• You check if an apple costs less than €2.\n") +
         Text("• You calculate how much you need to pay if you buy 3 apples.\n") +
         Text("• You decide if you prefer apples or bananas.\n"))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 5)
        (Text("In programming, all of these actions involve ") + Text("operators").font(.system(size: 28, weight: .semibold)) + Text(", which allow us to perform operations on values of the same type in Swift.\n") + Text("Let's explore them step by step!"))
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TheoryOperatorsViewStepTwoView: View {
    var body: some View {
        (Text("The = operator ") + Text("assigns").font(.system(size: 28, weight: .semibold)) + Text(" a value to a variable or constant"))
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("fruit").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("\"apple\"").foregroundColor(IDE_D9C87C) +
             Text("\n// Assign the String value “apple” to the constant fruit").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("var ").foregroundColor(IDE_FF79B2) +
             Text("price").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("1.5").foregroundColor(IDE_D9C87C) +
             Text("\n// Assign the Double value 1.5 to the variable price").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("isBanana").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("true").foregroundColor(IDE_FF79B2) +
             Text("\n// Assign the Bool value true to the constant isBanana").foregroundColor(IDEComment))
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

struct TheoryOperatorsViewStepThreeView: View {
    
    let headers = ["Operator", "Description", "Example"]
    let data = [
        ["+", "Addition", "2.1 + 3.5 → 5.6"],
        ["-", "Subtraction", "4 - 10 → -6"],
        ["*", "Multiplication", "3 * 5 → 15"],
        ["/", "Division", "9.0 / 2.0 → 4.5"],
        ["%", "Remainder", "10 % 3 → 1"]
    ]
    
    var body: some View {
        Text("Arithmetic operators help us to perform basic mathematical calculations:")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
        Grid {
            // Headers
            GridRow {
                ForEach(headers, id: \.self) { header in
                    Text(header)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 15))
                        .background(Color.gray.opacity(0.3))
                }
            }

            Divider()

            // Data
            ForEach(data, id: \.self) { row in
                GridRow {
                    ForEach(row, id: \.self) { cell in
                        Text(cell)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                    }
                }
            }
        }
    }
}

struct TheoryOperatorsViewStepFourView: View {
    var body: some View {
        Text("Imagine you buy 3 apples, and each apple costs 2 euros. How much do you spend in total?")
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("apples").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("3").foregroundColor(IDE_D9C87C))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("pricesPerApple").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("2").foregroundColor(IDE_D9C87C))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("totalCost").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("apples").foregroundColor(IDE_78C2B3) +
             Text(" * ").foregroundColor(.white) +
             Text("pricePerApple").foregroundColor(IDE_78C2B3))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("totalCost").foregroundColor(IDE_FF8170) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: 6").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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
        
        (Text("The ") + Text("%").font(.system(size: 28, weight: .semibold)) + Text(" (") + Text("modulo").font(.system(size: 28, weight: .semibold)) + Text(") operator gives the remainder of a division between Int values, so we cannot use it with decimal values. It’s useful, for example, to check if a number is even or odd:"))
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("10 % 2").foregroundColor(IDE_FF8170) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: 0 (even)").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("7 % 2").foregroundColor(IDE_FF8170) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: 1 (odd)").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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

struct TheoryOperatorsViewStepFiveView: View {
    
    var body: some View {
        Text("Mathematical operations always follow a specific order. Multiplication, division and modulo have priority over addition and subtraction. You can use parentheses () which have priority over all five.")
            .frame(maxWidth: .infinity, alignment: .leading)
        VStack() {
            (Text("var ").foregroundColor(IDE_FF79B2) +
             Text("x").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("2").foregroundColor(IDE_D9C87C))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("var ").foregroundColor(IDE_FF79B2) +
             Text("y").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("3").foregroundColor(IDE_D9C87C))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("var ").foregroundColor(IDE_FF79B2) +
             Text("y").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("3").foregroundColor(IDE_D9C87C))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("x").foregroundColor(IDE_78C2B3) +
             Text(" + ").foregroundColor(.white) +
             Text("y").foregroundColor(IDE_78C2B3) +
             Text(" * ").foregroundColor(.white) +
             Text("z").foregroundColor(IDE_78C2B3) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: 17").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("((").foregroundColor(.white) +
             Text("x").foregroundColor(IDE_78C2B3) +
             Text(" + ").foregroundColor(.white) +
             Text("y").foregroundColor(IDE_78C2B3) +
             Text(") * ").foregroundColor(.white) +
             Text("z").foregroundColor(IDE_78C2B3) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: 25").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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
        
        (Text("Note").font(.system(size: 28, weight: .semibold)) + Text(": If you divide two Int values, the result is also an Int (it discards decimals)"))
            .frame(maxWidth: .infinity, alignment: .leading)
        
        VStack() {
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("5").foregroundColor(IDE_D9C87C) +
             Text(" / ").foregroundColor(.white) +
             Text("2").foregroundColor(IDE_D9C87C) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: 2 (not 2.5!)").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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
        
        Text("If you need a decimal result, use Double values:")
            .frame(maxWidth: .infinity, alignment: .leading)
        
        VStack() {
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("5.0").foregroundColor(IDE_D9C87C) +
             Text(" / ").foregroundColor(.white) +
             Text("2.0").foregroundColor(IDE_D9C87C) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: 2.5").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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

struct TheoryOperatorsViewStepSixView: View {
    var body: some View {
        Text("In Swift, we can combine strings using the concatenation operator (+).")
            .frame(maxWidth: .infinity, alignment: .leading)
        
        VStack() {
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("firstName").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("\"Alice\"").foregroundColor(IDE_FF8170))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("firstName").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("\"Alice\"").foregroundColor(IDE_FF8170))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("fullName").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("firstName").foregroundColor(IDE_78C2B3) +
             Text(" + ").foregroundColor(.white) +
             Text("\" \"").foregroundColor(IDE_FF8170) +
             Text(" + ").foregroundColor(.white) +
             Text("lastName").foregroundColor(IDE_78C2B3))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("fullName").foregroundColor(IDE_78C2B3) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: Alice Brown").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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
        
        Text("Note: unlike numbers, you cannot use -, *, /, or % with strings!")
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TheoryOperatorsViewStepSevenView: View {
    
    let headers = ["Operator", "Equivalent To"]
    let data = [
        ["+=", "x = x + y"],
        ["-=", "x = x - y"],
        ["*=", "x = x * y"],
        ["/=", "x = x / y"],
        ["%=", "x = x % y"]
    ]
    
    var body: some View {
        Text("These operators combine an arithmetic operation (for numbers) or a concatenation operation (for strings) with the assignment operator, making the code shorter.")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
        
        Grid {
            // Headers
            GridRow {
                ForEach(headers, id: \.self) { header in
                    Text(header)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 15))
                        .background(Color.gray.opacity(0.3))
                }
            }
            
            Divider()
            
            // Data
            ForEach(data, id: \.self) { row in
                GridRow {
                    ForEach(row, id: \.self) { cell in
                        Text(cell)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                    }
                }
            }
        }
        
        Text("Example: Counting Down")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
        
        VStack() {
            (Text("var ").foregroundColor(IDE_FF79B2) +
             Text("countdown").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("10").foregroundColor(IDE_D9C87C))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("countdown ").foregroundColor(IDE_78C2B3) +
             Text(" -= ").foregroundColor(.white) +
             Text("2").foregroundColor(IDE_D9C87C) +
             Text("\n// Equivalent to countdown = countdown - 2").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("countdown").foregroundColor(IDE_78C2B3) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: 8").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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

struct TheoryOperatorsViewStepEightView: View {
    var body: some View {
        
        let headers = ["Operator", "Description", "Example"]
        let data = [
            ["==", "Equal to", "5 == 4 → false"],
            ["!=", "Not equal to", "5 != 4 → true"]
        ]
        
        Text("Comparison operators helps us compare values and return true or false. They can be used with numbers, strings and Bool values.")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
        
        Grid {
            // Headers
            GridRow {
                ForEach(headers, id: \.self) { header in
                    Text(header)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 15))
                        .background(Color.gray.opacity(0.3))
                }
            }
            
            Divider()
            
            // Data
            ForEach(data, id: \.self) { row in
                GridRow {
                    ForEach(row, id: \.self) { cell in
                        Text(cell)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                    }
                }
            }
        }
        .padding(.bottom, 10)
        
        VStack() {
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("temperature").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("30").foregroundColor(IDE_D9C87C))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("temperature").foregroundColor(IDE_78C2B3) +
             Text(" == ").foregroundColor(.white) +
             Text("20").foregroundColor(IDE_D9C87C) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: false").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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
        
        (Text("Remember!").font(.system(size: 28, weight: .semibold)) + Text(" The operator = is assignment, while == is comparison."))
            .frame(maxWidth: .infinity, alignment: .leading)
        
        VStack() {
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("x").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("10").foregroundColor(IDE_D9C87C) +
             Text("\n// Assigns 10 to x").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("x").foregroundColor(IDE_78C2B3) +
             Text(" == ").foregroundColor(.white) +
             Text("10").foregroundColor(IDE_D9C87C) +
             Text(")").foregroundColor(.white) +
             Text("\n// Compares x with 10 (true)").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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

struct TheoryOperatorsViewStepNineView: View {
    
    let headers = ["Operator", "Description", "Example"]
    let data = [
        [">", "Greater than", "4 > 7 → false"],
        ["<", "Less than", "7 < 4 → true"],
        [">=", "Greater than or equal to", "3 >= 3 → true"],
        ["<=", "Less than or equal to", "5 <= 4 → false"]
    ]
    
    var body: some View {
        Text("Numeric and String values use further comparison operators:")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
        
        Grid {
            // Headers
            GridRow {
                ForEach(headers, id: \.self) { header in
                    Text(header)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 15))
                        .background(Color.gray.opacity(0.3))
                }
            }
            
            Divider()
            
            // Data
            ForEach(data, id: \.self) { row in
                GridRow {
                    ForEach(row, id: \.self) { cell in
                        Text(cell)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                    }
                }
            }
        }
        .padding(.bottom, 10)
        
        VStack() {
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("temperature").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("30").foregroundColor(IDE_D9C87C))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("temperature").foregroundColor(IDE_78C2B3) +
             Text(" > ").foregroundColor(.white) +
             Text("25").foregroundColor(IDE_D9C87C) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: true").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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
        
        (Text("Note").font(.system(size: 28, weight: .semibold)) + Text(": Comparison operators with String values return true or false based on the lexicographic order (like a dictionary)."))
            .frame(maxWidth: .infinity, alignment: .leading)
        
        VStack() {
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("fruit1").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("\"Apple\"").foregroundColor(IDE_FF8170))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("fruit2").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("\"Banana\"").foregroundColor(IDE_FF8170))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("fruit1").foregroundColor(IDE_78C2B3) +
             Text(" == ").foregroundColor(.white) +
             Text("fruit2").foregroundColor(IDE_78C2B3) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: false").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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

struct TheoryOperatorsViewStepTenView: View {
    
    let headers = ["Operator", "Description", "Example"]
    let data = [
        ["&&\n", "AND - Returns true if both conditions are true\n", "(5 < 3) && (10 > 8) → false\n"],
        ["||\n", "OR - Returns true if at least one condition is true\n", "(5 < 3) || (10 > 8) → true\n"],
        ["!", "NOT - Reverse condition meaning", "!(4 > 7) → true"],
    ]
    
    var body: some View {
        Text("Logical operators allow us to combine multiple conditions.")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
        
        Grid {
            // Headers
            GridRow {
                ForEach(headers, id: \.self) { header in
                    Text(header)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.system(size: 15))
                        .background(Color.gray.opacity(0.3))
                }
            }
            
            Divider()
            
            // Data
            ForEach(data, id: \.self) { row in
                GridRow {
                    ForEach(row, id: \.self) { cell in
                        Text(cell)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 15))
                    }
                }
            }
        }
        
        Text("For example, imagine a club requires you to be at least 18 years old AND have a ticket.")
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 20)
        
        VStack() {
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("hasTicket").foregroundColor(IDE_4FB0CC) +
             Text(" = ").foregroundColor(.white) +
             Text("true").foregroundColor(IDE_FF79B2))
            .frame(maxWidth: .infinity, alignment: .leading)
            
            (Text("let ").foregroundColor(IDE_FF79B2) +
             Text("canEnter").foregroundColor(IDE_4FB0CC) +
             Text(" = !(").foregroundColor(.white) +
             Text("age").foregroundColor(IDE_B181EC) +
             Text(" < ").foregroundColor(.white) +
             Text("18").foregroundColor(IDE_D9C87C) +
             Text(") && (").foregroundColor(.white) +
             Text("hasTicket").foregroundColor(IDE_78C2B3) +
             Text(")").foregroundColor(.white))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 5)
            
            (Text("print").foregroundColor(IDE_B181EC) +
             Text("(").foregroundColor(.white) +
             Text("canEnter").foregroundColor(IDE_78C2B3) +
             Text(")").foregroundColor(.white) +
             Text("\n// Output: true").foregroundColor(IDEComment))
            .frame(maxWidth: .infinity, alignment: .leading)
        }
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
