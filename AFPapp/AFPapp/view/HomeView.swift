//
//  HomeView 2.swift
//  AFPapp
//
//  Created by Matteo Molino on 14/02/25.
//

import SwiftUI

// private let backgroundGradientEndColor: Color = Color(red: 0.984, green: 0.639, blue: 0.239)
// private let backgroundGradientStartColor: Color = Color(red: 1.000, green: 0.255, blue: 0.161)

struct HomeView: View {
    let DIFFICULTY_ICON_NAME: String = "bolt.fill"
    // @State var progress: Double = 0.5
    // @State var theoryProgress: Double = 0.3
    // @State var quizProgress: Double = 0.7
    @State var currentFileName: String = "strings" // valore di default
    @StateObject var vmTheory = TheoryViewModel()
    @State private var selectedLessonID: Int = 1
    
    
    // Stati per attivare le navigazioni verso Quiz e Theory
    @State var isQuizActive: Bool = false
    @State var isTheoryActive: Bool = false
    
    var body: some View {
        NavigationStack {
            
            Text("Lessons")
                .font(.system(size: 40, weight: .bold))
                // .foregroundColor(backgroundGradientEndColor)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 40)
                .padding(.top, 20)
                .padding(.horizontal, 20)
            
            ZStack {
                ScrollView() {
                    SectionView(
                        title: "CONSTANTS AND VARIABLES",
                        subTitle: DIFFICULTY_ICON_NAME,
                        difficulty: 1,
                        fileName: "varconstdata",
                        // theoryType: vmTheory.theoryList[0],
                        lessonID: 1,
                        selectLessonID: {self.selectedLessonID = 1},
                        isQuizActive: $isQuizActive,
                        isTheoryActive: $isTheoryActive,
                        currentFileName: $currentFileName
                    )
                    SectionView(
                        title: "DATA TYPES",
                        subTitle: DIFFICULTY_ICON_NAME,
                        difficulty: 1,
                        fileName: "operators",
                        // theoryType: vmTheory.theoryList[1],
                        lessonID: 2,
                        selectLessonID: {self.selectedLessonID = 2},
                        isQuizActive: $isQuizActive,
                        isTheoryActive: $isTheoryActive,
                        currentFileName: $currentFileName
                    )
                    SectionView(
                        title: "OPERATORS",
                        subTitle: DIFFICULTY_ICON_NAME,
                        difficulty: 1,
                        fileName: "control_flow",
                        // theoryType: vmTheory.theoryList[2],
                        lessonID: 3,
                        selectLessonID: {self.selectedLessonID = 3},
                        isQuizActive: $isQuizActive,
                        isTheoryActive: $isTheoryActive,
                        currentFileName: $currentFileName
                    )
                    SectionView(
                        title: "CONTROL FLOW",
                        subTitle: DIFFICULTY_ICON_NAME,
                        difficulty: 1,
                        fileName: "strings",
                        // theoryType: vmTheory.theoryList[3],
                        lessonID: 4,
                        selectLessonID: {self.selectedLessonID = 4},
                        isQuizActive: $isQuizActive,
                        isTheoryActive: $isTheoryActive,
                        currentFileName: $currentFileName
                    )
                    SectionView(
                        title: "STRINGS",
                        subTitle: DIFFICULTY_ICON_NAME,
                        difficulty: 1,
                        fileName: "functions",
                        // theoryType: vmTheory.theoryList[4],
                        lessonID: 5,
                        selectLessonID: {self.selectedLessonID = 5},
                        isQuizActive: $isQuizActive,
                        isTheoryActive: $isTheoryActive,
                        currentFileName: $currentFileName
                    )
                    SectionView(
                        title: "STRUCTURES",
                        subTitle: DIFFICULTY_ICON_NAME,
                        difficulty: 1,
                        fileName: "structures",
                        // theoryType: vmTheory.theoryList[5],
                        lessonID: 6,
                        selectLessonID: {self.selectedLessonID = 6},
                        isQuizActive: $isQuizActive,
                        isTheoryActive: $isTheoryActive,
                        currentFileName: $currentFileName
                    )
                }
                .scrollContentBackground(.hidden)
                .background(Color.white)
                .padding(.horizontal, 20)
                
                // NavigationLink nascosti per le destinazioni Quiz e Theory
                NavigationLink(
                    "",
                    destination: QuizView(quizFileName: currentFileName)
                        .id(currentFileName),
                    isActive: $isQuizActive
                )
                .opacity(0)
                NavigationLink(
                    "",
                    destination: TheoryView(lessonID: $selectedLessonID).environmentObject(vmTheory),
                    isActive: $isTheoryActive
                )
                .opacity(0)
            }
        }
    }
}

/* struct TheoryView: View {
    var body: some View {
        Text("Theory View")
            .navigationTitle("Theory")
            .toolbar(.hidden, for: .tabBar) // Nasconde la bottom bar
    }
} */

// --- Componenti UI di supporto ---

struct RectangleHome: View {
    var title: String
    var subTitle: String
    var difficulty: Int = 1
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 26, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
            HStack {
                Text("Difficulty: ")
                    .foregroundColor(.white)
                    .font(.system(size: 23, weight: .light))
                ForEach(1...difficulty, id: \.self) { _ in
                    Image(systemName: subTitle)
                        .foregroundColor(.white)
                }
            }
            .padding(.top, 12)
        }
        .padding(.vertical, 20)
    }
}

struct PercentageHome: View {
    @Binding var progress: Double
    
    var body: some View {
        ZStack {
            CircularProgressView(progress: $progress)
        }
        .frame(width: 70, height: 70)
    }
}

struct CircularProgressView: View {
    @Binding var progress: Double
    
    var body: some View {
        if progress < 1 {
            ZStack {
                Circle()
                    .stroke(
                        .white.opacity(0.2),
                        lineWidth: 10
                    )
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        Color(.white),
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

// --- SectionView e SubSection ---

struct SectionView: View {
    var title: String
    var subTitle: String
    var difficulty: Int = 1
    var fileName: String
    let lessonID: Int
    let selectLessonID: () -> Void
    @State var isOpen: Bool = false
    @State var progress: Double = 0.0
    // @Binding var progress: Double
    @Binding var isQuizActive: Bool
    @Binding var isTheoryActive: Bool
    @Binding var currentFileName: String
    
    var body: some View {
        
        VStack {
            Button(action: {
                self.isOpen.toggle()
                selectLessonID()
            }) {
                HStack(alignment: .center) {
                    RectangleHome(title: title, subTitle: subTitle, difficulty: difficulty)
                        .padding(.trailing)
                    
                    Spacer()
                    
                    PercentageHome(progress: $progress)
                        .frame(width: 60, alignment: .trailing)
                }
                .padding()
            }
            .frame(height: 140)
            .sheet(isPresented: $isOpen) {
                SubSection(
                    onQuizSelected: {
                        // Aggiorna il fileName in base alla sezione cliccata
                        currentFileName = fileName
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.isQuizActive = true
                        }
                    },
                    onTheorySelected: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            self.isTheoryActive = true
                        }
                    }
                )
                .presentationDetents([.fraction(0.5)])
            }
        }
        .onAppear {
            self.progress = TheoryViewModel().theoryList[lessonID - 1].theoryProgress
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(20)
        )
        .padding(.bottom, 20)
    }
}
/*
struct SubSection: View {
    @Environment(\.dismiss) var dismiss
    var onQuizSelected: (() -> Void)? = nil
    var onTheorySelected: (() -> Void)? = nil
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Where do you want to go?")
                .font(.system(size: 30, weight: .bold, design: .default))
            HStack {
                Button(action: {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        onQuizSelected?()
                    }
                }) {
                    Text("Quiz")
                }
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
                
                Button(action: {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        onTheorySelected?()
                    }
                }) {
                    Text("Theory")
                }
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
*/

struct SubSection: View {
    @Environment(\.dismiss) var dismiss
    var onQuizSelected: (() -> Void)? = nil
    var onTheorySelected: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Select an option")
                .padding()
                .font(.title.bold())
                .foregroundColor(.primary)
            
            HStack(spacing: 20) {
                OptionButton(title: "Quiz", systemImage: "questionmark.circle", action: {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        onQuizSelected?()
                    }
                })
                
                OptionButton(title: "Theory", systemImage: "book", action: {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        onTheorySelected?()
                    }
                })
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground)) // Sfondo bianco della sheet
        .cornerRadius(15)
        .padding(.horizontal, 20)
    }
}

// 🔹 Pulsanti con gradienti e testo bianco
struct OptionButton: View {
    let title: String
    let systemImage: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: systemImage)
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.white)
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(width: 150, height: 120)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [backgroundGradientStartColor, backgroundGradientEndColor]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(15)
        }
    }
}


#Preview {
    HomeView()
}
