//
//  ChooseView.swift
//  AFPapp
//
//  Created by Bernardo Macaluso on 12/02/25.
//

import SwiftUI

struct ChooseView: View {
    
    @State var showView: Bool = false
    @State var choice: Int? = nil
    
    var body: some View {
        switch choice {
        case 1: ContentView().navigationBarBackButtonHidden(true)
        case 2: ProfileView().navigationBarBackButtonHidden(true)
        default:
            VStack() {
                Text("Theory completed!")
                    .font(.system(size: 45, weight: .bold))
                    .foregroundColor(backgroundGradientEndColor)
                    .padding(.bottom, 125)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    showView.toggle()
                    choice = 1
                }) {
                    HStack {
                        Text("Lessons")
                            .font(.system(size: 28, weight: .heavy))
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                        Spacer()
                        Image(systemName: "book.closed.fill")
                            .resizable()
                            .padding(.trailing, 20)
                            .frame(width: 50, height: 36)
                            .foregroundColor(.white)
                    }
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .frame(height: 91)
                        .cornerRadius(20)
                    )
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 60)
                
                Button(action: {
                    choice = 2
                }) {
                    HStack {
                        Text("Quiz")
                            .font(.system(size: 28, weight: .heavy))
                            .foregroundColor(.white)
                            .padding(.leading, 20)
                        Spacer()
                        Image(systemName: "questionmark.text.page.fill")
                            .resizable()
                            .padding(.trailing, 20)
                            .frame(width: 50, height: 36)
                            .foregroundColor(.white)
                    }
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .frame(height: 91)
                        .cornerRadius(20)
                    )
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 60)
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .padding(.vertical, 70)
        }
    }
}

#Preview {
    ChooseView()
}
