import SwiftUI

// MARK: - Leaderboard Manager
/// Simula una sincronizzazione del punteggio con una leaderboard (ad es. via API)
class LeaderboardManager: ObservableObject {
    @Published var leaderboardScore: Int = 0
    
    func syncScore(_ score: Int) async {
        // Simulazione di una chiamata di rete (delay di 0.5 secondi)
        try? await Task.sleep(nanoseconds: 500_000_000)
        DispatchQueue.main.async {
            self.leaderboardScore = score
            print("Punteggio \(score) sincronizzato con la leaderboard.")
        }
    }
}

// MARK: - QuizView
struct QuizView: View {
    
    @State private var totalScore: Int = 0
    @State private var questionIndex: Int = 0
    @State private var quiz: QuizModel
    @State private var showHint: Bool = false
    @State private var codeTextHeight: CGFloat = 0
    @StateObject private var leaderboardManager = LeaderboardManager()
    @EnvironmentObject var viewModel: AuthViewModel
    
    var quizFileName: String
    
    init(quizFileName: String) {
        self.quizFileName = quizFileName
        self.quiz = QuizModel(fileName: quizFileName)
    }
    
    var body: some View {
        if quiz.questions.isEmpty {
            unavailableQuizView
        } else {
            quizContentView
        }
    }
    
    // View da mostrare se il quiz non è disponibile
    private var unavailableQuizView: some View {
        VStack(spacing: 20) {
            Text("Quiz non disponibile")
                .font(.title)
                .fontWeight(.bold)
            Text("Il file \(quiz.fileName).json non esiste o non è stato caricato correttamente.")
                .multilineTextAlignment(.center)
                .padding()
        }
        .navigationTitle("Quiz")
        .toolbar(.hidden, for: .tabBar)
    }
    
    // View principale del quiz
    private var quizContentView: some View {
        VStack(spacing: 20) {
            headerView
            questionCardView
            answersView
            Spacer()
            navigationButtons
        }
        .padding(5)
        .toolbar(.hidden, for: .tabBar)
        .sheet(isPresented: $showHint) {
            HintView(hint: quiz.questions[questionIndex].questionID)
        }
    }
    
    // MARK: - Componenti UI
    
    private var headerView: some View {
        HStack {
            Text("Question \(questionIndex + 1) of \(quiz.questions.count)")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(.primary)
            Spacer()
            if let user = viewModel.currentUser {
                HStack {
                    Image(systemName: "star.circle.fill")
                        .font(.system(size: 25))
                        .foregroundStyle(Color.orange)
                    Text("\(user.punteggio)")
                        .font(.title2)
                        .fontWeight(.bold)
                }
            }
        }
        .padding(.horizontal)
        .padding(.top)
    }
    
    private var questionCardView: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(quiz.questions[questionIndex].question)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
                    .layoutPriority(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Button(action: { showHint.toggle() }) {
                    Image(systemName: "lightbulb.circle.fill")
                        .font(.system(size: 30))
                        .foregroundStyle(Color.yellow)
                }
                .padding(.trailing)
            }
            
            if !quiz.questions[questionIndex].code.isEmpty {
                ZStack {
                    // Sfondo fisso del contenitore del codice
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.white.opacity(0.95))
                    
                    // Solo il testo del codice è scrollabile
                    ScrollView(.vertical, showsIndicators: true) {
                        Text(quiz.questions[questionIndex].code)
                            .font(.system(size: 18, design: .monospaced))
                            .foregroundColor(.black)
                            .padding()
                            .background(
                                GeometryReader { geometry in
                                    Color.clear
                                        .onAppear { codeTextHeight = geometry.size.height }
                                        .onChange(of: geometry.size.height) { newValue in
                                            codeTextHeight = newValue
                                        }
                                }
                            )
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
                .frame(height: min(codeTextHeight, 200))
                .padding()
            }
        }
        .frame(maxWidth: .infinity, minHeight: 300)
        .background(
            LinearGradient(colors: [Color.orange, Color.red],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
        )
        .cornerRadius(15)
        .padding(.horizontal)
    }
    
    
    private var answersView: some View {
        VStack(spacing: 15) {
            ForEach($quiz.questions[questionIndex].answers, id: \.text) { $answer in
                Button(action: {
                    if !answer.isSelected {
                        answer.isSelected = true
                        QuizModel.saveQuestionToStorage(fileName: quizFileName, questions: quiz.questions)
                        if (answer.isCorrect) && (viewModel.currentUser != nil) {
                            if let currentPunteggio = viewModel.currentUser?.punteggio {
                                let newScore = currentPunteggio + quiz.questions[questionIndex].score
                                Task {
                                    await viewModel.updatePunteggio(newPunteggio: newScore)
                                }
                            }
                        }
                    }
                }) {
                    Text(answer.text)
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(getForegroundColor(answer: answer))
                        .background(getButtonColor(answer: answer))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.orange, lineWidth: 2)
                        )
                }
                .disabled(quiz.questions[questionIndex].hasAnswered)
            }
        }
        .padding(.horizontal)
    }
    
    // Bottone Prev, Next o Finish (quando si è arrivati all'ultima domanda)
    private var navigationButtons: some View {
        HStack {
            if questionIndex > 0 {
                Button(action: prevQuestion) {
                    Text("Prev")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 120, height: 50)
                        .background(
                            LinearGradient(colors: [Color.red, Color.orange],
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .cornerRadius(10)
                }
            } else {
                Spacer().frame(width: 120, height: 50)
            }
            
            Spacer()
            
            if questionIndex < quiz.questions.count - 1 {
                Button(action: nextQuestion) {
                    Text("Next")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 120, height: 50)
                        .background(
                            LinearGradient(colors: [Color.red, Color.orange],
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .cornerRadius(10)
                }
            } else {
                Button(action: finishQuiz) {
                    Text("Finish")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 120, height: 50)
                        .background(
                            LinearGradient(colors: [Color.green, Color.blue],
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
    
    // MARK: - Funzioni di Supporto
    
    func getButtonColor(answer: AnswerModel) -> Color {
        if answer.isSelected {
            return answer.isCorrect ? Color.green : Color.red
        } else {
            return (quiz.questions[questionIndex].hasAnswered && answer.isCorrect) ? Color.green : Color.white
        }
    }
    
    func getForegroundColor(answer: AnswerModel) -> Color {
        return (answer.isSelected || (answer.isCorrect && quiz.questions[questionIndex].hasAnswered)) ? Color.white : Color.black
    }
    
    // Navigazione tra domande
    func nextQuestion() {
        if questionIndex < quiz.questions.count - 1 {
            questionIndex += 1
        }
    }
    
    func prevQuestion() {
        if questionIndex > 0 {
            questionIndex -= 1
        }
    }
    
    // Chiamata finale per sincronizzare il punteggio con la leaderboard
    func finishQuiz() {
        Task {
            await leaderboardManager.syncScore(totalScore)
            // Puoi aggiungere eventuali ulteriori azioni, ad esempio la navigazione a una schermata di riepilogo.
        }
    }
}

// MARK: - HintView
struct HintView: View {
    var hint: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Suggerimento")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text(hint)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.black)
            Button(action: { dismiss() }) {
                Text("Chiudi")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        LinearGradient(colors: [Color.orange, Color.red],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
                    .cornerRadius(10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGray6))
        .ignoresSafeArea()
    }
}

#Preview {
    QuizView(quizFileName: "strings")
}
