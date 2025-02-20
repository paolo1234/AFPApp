import SwiftUI

// MARK: - Costanti Globali
//private let backgroundGradientStartColor = Color(red: 1.000, green: 0.255, blue: 0.161)
//private let backgroundGradientEndColor = Color(red: 0.984, green: 0.639, blue: 0.239)

// MARK: - Modello per le Sezioni Lezione
struct LessonSectionData: Identifiable {
    let id: Int
    let title: String
    let fileName: String
    let difficulty: Int
}

// MARK: - HomeView
struct HomeView: View {
    private let DIFFICULTY_ICON_NAME = "bolt.fill"
    @State private var currentFileName: String = "strings"
    @StateObject private var vmTheory = TheoryViewModel()
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var selectedLessonID: Int = 1
    @State private var showLoginAlert = false
    
    // Stati per attivare la navigazione verso Quiz e Theory
    @State private var isQuizActive = false
    @State private var isTheoryActive = false
    
    // Definizione delle lezioni
    private let lessons: [LessonSectionData] = [
        LessonSectionData(id: 1, title: "CONSTANTS AND VARIABLES", fileName: "varconstdata", difficulty: 1),
        LessonSectionData(id: 2, title: "DATA TYPES", fileName: "varconstdata", difficulty: 1),
        LessonSectionData(id: 3, title: "OPERATORS", fileName: "control_flow", difficulty: 1),
        LessonSectionData(id: 4, title: "CONTROL FLOW", fileName: "control_flow", difficulty: 1),
        /* LessonSectionData(id: 5, title: "STRINGS", fileName: "strings", difficulty: 1),
        LessonSectionData(id: 6, title: "STRUCTURES", fileName: "control_flow", difficulty: 2) */
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Lessons")
                    .font(.system(size: 40, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 20)
                
                ZStack {
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(lessons) { lesson in
                                SectionView(
                                    title: lesson.title,
                                    subTitle: DIFFICULTY_ICON_NAME,
                                    difficulty: lesson.difficulty,
                                    fileName: lesson.fileName,
                                    lessonID: lesson.id,
                                    selectLessonID: { self.selectedLessonID = lesson.id },
                                    isQuizActive: $isQuizActive,
                                    isTheoryActive: $isTheoryActive,
                                    currentFileName: $currentFileName
                                )
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.white)
                    
                    // NavigationLink nascosti
                    NavigationLink(
                        destination: QuizView(quizFileName: currentFileName).id(currentFileName),
                        isActive: $isQuizActive
                    ) { EmptyView() }
                    
                    NavigationLink(
                        destination: TheoryView(lessonID: $selectedLessonID)
                            .environmentObject(vmTheory),
                        isActive: $isTheoryActive
                    ) { EmptyView() }
                }
            }
        }
        .onAppear {
            checkAndShowAlert()
        }
        .alert(isPresented: $showLoginAlert) {
            Alert(
                title: Text("Syncronize progress"),
                message: Text("Do you wish to syncronize your progress or load your profile progress?."),
                primaryButton: .default(Text("Yes")) {
                    vmTheory.syncTheoryProgressToFirebase()
                    vmTheory.startSyncTimer()
                },
                secondaryButton: .cancel(Text("No (use current account progress)")) {
                    vmTheory.fetchProgressFromFirebase()
                }
            )
        }
        .onDisappear {
            if let user = viewModel.currentUser {
                vmTheory.stopSyncTimer()
            }
        }
    }
    
    func checkAndShowAlert() {
        let alertShownKey = "alertShown"
        let hasShownAlert = UserDefaults.standard.bool(forKey: alertShownKey)

        if let user = viewModel.currentUser {
            if !hasShownAlert {
                showLoginAlert = true
                UserDefaults.standard.set(true, forKey: alertShownKey)
            }
        } else {
            UserDefaults.standard.set(false, forKey: alertShownKey)
        }
    }
}

// MARK: - Componenti UI di Supporto

struct RectangleHome: View {
    let title: String
    let subTitle: String
    let difficulty: Int
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .foregroundColor(.white)
                .font(.system(size: 26, weight: .medium))
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
            
            HStack {
                Text("Difficulty: ")
                    .foregroundColor(.white)
                    .font(.system(size: 23, weight: .light))
                ForEach(0..<difficulty, id: \.self) { _ in
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
        CircularProgressView(progress: $progress)
            .frame(width: 70, height: 70)
    }
}

struct CircularProgressView: View {
    @Binding var progress: Double
    
    var body: some View {
        if progress < 1 {
            ZStack {
                Circle()
                    .stroke(Color.white.opacity(0.2), lineWidth: 10)
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.white, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: progress)
                Text("\(progress * 100, specifier: "%.0f")%")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
            }
        } else {
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .transition(.scale)
                .animation(.easeInOut, value: progress)
        }
    }
}

// MARK: - SectionView
struct SectionView: View {
    let title: String
    let subTitle: String
    let difficulty: Int
    let fileName: String
    let lessonID: Int
    let selectLessonID: () -> Void
    
    @State private var isOpen: Bool = false
    @State private var progress: Double = 0.0
    @Binding var isQuizActive: Bool
    @Binding var isTheoryActive: Bool
    @Binding var currentFileName: String
    
    var body: some View {
        VStack {
            Button(action: {
                isOpen.toggle()
                selectLessonID()
            }) {
                HStack {
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
                        currentFileName = fileName
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isQuizActive = true
                        }
                    },
                    onTheorySelected: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            isTheoryActive = true
                        }
                    }
                )
                .presentationDetents([.fraction(0.5)])
            }
        }
        .onAppear {
            // Recupera il progresso della teoria per la lezione corrente
            let theoryProgress = TheoryViewModel().theoryList[lessonID - 1].theoryProgress
            // Calcola il progresso del quiz per il file associato alla lezione
            let quizProgress = QuizProgressService.calculateQuizProgress(for: fileName)
            // Imposta il progresso come media tra i due
            progress = (theoryProgress + quizProgress) / 2.0
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

// MARK: - SubSection e OptionButton
struct SubSection: View {
    @Environment(\.dismiss) private var dismiss
    var onQuizSelected: (() -> Void)? = nil
    var onTheorySelected: (() -> Void)? = nil
    
    var body: some View {
        VStack(spacing: 25) {
            Text("Select an option")
                .padding()
                .font(.title.bold())
                .foregroundColor(.primary)
            
            HStack(spacing: 20) {
                OptionButton(title: "Quiz", systemImage: "questionmark.circle") {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        onQuizSelected?()
                    }
                }
                
                OptionButton(title: "Theory", systemImage: "book") {
                    dismiss()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        onTheorySelected?()
                    }
                }
            }
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .padding(.horizontal, 20)
    }
}

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

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AuthViewModel())
    }
}

