//
//  HomeView 2.swift
//  AFPapp
//
//  Created by Matteo Molino on 14/02/25.
//

import SwiftUI

private let backgroundGradientEndColor: Color = Color(red: 0.984, green: 0.639, blue: 0.239)
private let backgroundGradientStartColor: Color = Color(red: 1.000, green: 0.255, blue: 0.161)

struct HomeView: View {
    let DIFFICULTY_ICON_NAME: String = "bolt.fill"
    @State var progress: Double = 0.5
    @State var theoryProgress: Double = 0.3
    @State var quizProgress: Double = 0.7
    
    // Stati per attivare le navigazioni verso Quiz e Theory
    @State var isQuizActive: Bool = false
    @State var isTheoryActive: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    SectionView(title: "DATA TYPES", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress, isQuizActive: $isQuizActive, isTheoryActive: $isTheoryActive)
                    SectionView(title: "OPERATORS", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress, isQuizActive: $isQuizActive, isTheoryActive: $isTheoryActive)
                    SectionView(title: "CONTROL FLOW", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress, isQuizActive: $isQuizActive, isTheoryActive: $isTheoryActive)
                    SectionView(title: "STRINGS", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress, isQuizActive: $isQuizActive, isTheoryActive: $isTheoryActive)
                    SectionView(title: "FUNCTIONS", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress, isQuizActive: $isQuizActive, isTheoryActive: $isTheoryActive)
                    SectionView(title: "STRUCTURES", subTitle: DIFFICULTY_ICON_NAME, difficulty: 1, progress: $progress, isQuizActive: $isQuizActive, isTheoryActive: $isTheoryActive)
                }
                .listRowSpacing(20)
                .scrollContentBackground(.hidden)
                .background(Color.white)
                .navigationTitle("Home")
                
                // NavigationLink nascosti per le destinazioni Quiz e Theory
                NavigationLink("", destination: QuizView(), isActive: $isQuizActive)
                    .opacity(0)
                NavigationLink("", destination: TheoryView(), isActive: $isTheoryActive)
                    .opacity(0)
            }
        }
    }
}

struct TheoryView: View {
    var body: some View {
        Text("Theory View")
            .navigationTitle("Theory")
            .toolbar(.hidden, for: .tabBar) // Nasconde la bottom bar
    }
}

struct RectangleHome: View {
    var title: String
    var subTitle: String
    var difficulty: Int = 1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 28, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            HStack {
                ForEach(1...difficulty, id: \.self) { _ in
                    Image(systemName: subTitle)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 12)
        }
    }
}

struct PercentageHome: View {
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            CircularProgressView(progress: progress)
        }
        .frame(width: 70, height: 70)
    }
}

struct CircularProgressView: View {
    let progress: Double
    
    var body: some View {
        if progress < 1 {
            ZStack {
                Circle()
                    .stroke(
                        Color(red: 0.941, green: 0.318, blue: 0.22).opacity(0.5),
                        lineWidth: 10
                    )
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        Color(red: 1, green: 0.255, blue: 0.161),
                        style: StrokeStyle(
                            lineWidth: 10,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: progress)
            }
            Text("\(progress * 100, specifier: "%.0f")%")
                .foregroundColor(.white)
                .font(.system(size: 20))
                .bold()
        } else {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .transition(.scale)
                .animation(.easeInOut, value: 1)
        }
    }
}

// Rinominiamo la custom Section in SectionView per evitare conflitti con SwiftUI.Section
struct SectionView: View {
    var title: String
    var subTitle: String
    var difficulty: Int = 1
    @State var isOpen: Bool = false
    @Binding var progress: Double
    @Binding var isQuizActive: Bool
    @Binding var isTheoryActive: Bool
    
    var body: some View {
        VStack {
            Button(
                action: { self.isOpen.toggle() },
                label: {
                    HStack(alignment: .center) {
                        RectangleHome(title: title, subTitle: subTitle, difficulty: difficulty)
                            .padding(.trailing)
                        
                        Spacer()
                        
                        PercentageHome(progress: $progress)
                            .frame(width: 60, alignment: .trailing)
                    }
                    .padding()
                }
            )
            .sheet(isPresented: $isOpen) {
                SubSection(
                    onQuizSelected: {
                        self.isQuizActive = true
                    },
                    onTheorySelected: {
                        self.isTheoryActive = true
                    }
                )
                .presentationDetents([.fraction(0.5)])
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
            )
        )
    }
}

struct SubSection: View {
    @Environment(\.dismiss) var dismiss
    var onQuizSelected: (() -> Void)? = nil
    var onTheorySelected: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Where do you want to go?")
                .font(.system(size: 30, weight: .bold, design: .default))
            HStack {
                Button(
                    action: {
                        dismiss()
                        DispatchQueue.main.async {
                            onQuizSelected?()
                        }
                    },
                    label: {
                        Text("Quiz")
                    }
                )
                .buttonStyle(PlainButtonStyle())
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    )
                    .frame(width: 180, height: 90)
                )
                
                Button(
                    action: {
                        dismiss()
                        DispatchQueue.main.async {
                            onTheorySelected?()
                        }
                    },
                    label: {
                        Text("Theory")
                    }
                )
                .buttonStyle(PlainButtonStyle())
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                    )
                    .frame(width: 180, height: 90)
                )
            }
            .padding(.vertical, 50)
            .padding(.horizontal)
            .foregroundColor(.white)
            .font(.system(size: 23, weight: .medium))
            .frame(maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    HomeView()
}
