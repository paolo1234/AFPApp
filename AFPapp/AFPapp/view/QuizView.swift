//
//  QuizView.swift
//  AFPapp
//
//  Created by Alessio Accardo on 11/02/25.
//

import SwiftUI

struct QuizView: View {
    
    @State var questionNum: Int = 1
    @State var starsNum: Int = 400
    @State var questionText: String = "What does the following code do?"
    @State var blankSpace: String = "Lorem ipsum ___ sit amet qiwfonweqfo qwajhiqwoinid fiojiqiodnqwo"
    @State var option1: String = "Option 1"
    @State var option2: String = "Option 2"
    @State var option3: String = "Option 3"
    @State var option4: String = "Option 4"
    
    var body: some View {
        
        VStack {
            HStack {
                VStack() {
                    VStack(alignment: .leading) {
                        Text("QUIZ")
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundStyle(.primary)
                            .padding(.bottom, 10)
                        Text("Question \(questionNum) of 10")
                            .font(.title2)
                            .foregroundStyle(.primary)
                    }
                }
                .padding()
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Button(action: {}) {
                        Image(systemName: "lightbulb.max.fill")
                            .font(.system(size: 25, weight: .bold))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color(red: 0.984, green: 0.639, blue: 0.239))
                            .padding(.bottom, 10)
                    }
                    HStack {
                        Image(systemName: "star.circle")
                            .font(.system(size: 25))
                            .foregroundStyle(Color(red: 0.984, green: 0.639, blue: 0.239))
                        Text("\(starsNum)")
                            .font(.title3)
                    }
                    
                }
                .padding()
            }
            
            VStack() {
                Text("\(questionText)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(red: 0.973, green: 0.973, blue: 1))
                    .multilineTextAlignment(.leading)
                    .padding()
                    
                    Text("\(blankSpace)")
                        .font(.title2)
                        .frame(width: 350, height: 200, alignment: .center)
                        .multilineTextAlignment(.center)
                        .background(.white)
                        .cornerRadius(10)
                        .padding()
            }
            .frame(height: 300)
            .background(LinearGradient(colors: [Color(red: 0.984, green: 0.639, blue: 0.239), Color(red: 1, green: 0.255, blue: 0.161)], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
            .padding(.bottom)
            
            OptionButton(option: $option1)
            OptionButton(option: $option2)
            OptionButton(option: $option3)
            OptionButton(option: $option4)
            
            HStack {
                Button(action: {}) {
                    Image(systemName: "arrow.backward.circle.fill")
                        .font(.system(size: 40, weight: .medium))
                        .foregroundStyle(Color(red: 0.984, green: 0.639, blue: 0.239))
                        //.offset(x: 0, y: -10)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.system(size: 40, weight: .medium))
                        .foregroundStyle(Color(red: 0.984, green: 0.639, blue: 0.239))
                        //.offset(x: 0, y: -10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    QuizView()
}

struct OptionButton: View {
    
    @Binding var option: String
    
    var body: some View {
        Button(action: {}) {
            Text("\(option)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(.black)
        }
        .frame(width: 350, height: 50)
        .background(.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 0.984, green: 0.639, blue: 0.239), lineWidth: 3)
        )
        .padding(.bottom, 10)

    }
}
