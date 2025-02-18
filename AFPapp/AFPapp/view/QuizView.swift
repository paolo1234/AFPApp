import SwiftUI

struct QuizView: View {
    
    @State private var totalScore: Int = 0
    @State private var questionIndex: Int = 0
    @State private var quiz: QuizModel
    @State private var showHint: Bool = false
    var quizFileName: String
    
    init(quizFileName: String) {
        self.quizFileName = quizFileName
        self.quiz = QuizModel(fileName: quizFileName)
    }
    
    var body: some View {
        if quiz.questions.isEmpty {
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
        } else {
            VStack(spacing: 20) {
                
                // Intestazione
                HStack {
                    Text("Question \(questionIndex + 1) of \(quiz.questions.count)")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.circle.fill")
                            .font(.system(size: 25))
                            .foregroundStyle(Color.orange)
                        Text("\(totalScore)")
                            .font(.title2)
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                // Card domanda
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        Text(quiz.questions[questionIndex].question)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.white)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        Button(action: {
                            showHint.toggle()
                        }) {
                            Image(systemName: "lightbulb.circle.fill")
                                .font(.system(size: 30))
                                .foregroundStyle(Color.yellow)
                        }
                        .padding(.trailing)
                    }
                    
                    if !quiz.questions[questionIndex].code.isEmpty {
                        ScrollView(.vertical, showsIndicators: true) {
                            Text(quiz.questions[questionIndex].code)
                                .font(.system(size: 18, design: .monospaced))
                                .foregroundColor(.black)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.white.opacity(0.95))
                                .cornerRadius(12)
                        }
                        .frame(maxHeight: 200)
                        .padding(.horizontal)
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
                
                // Sezione risposte
                VStack(spacing: 15) {
                    ForEach($quiz.questions[questionIndex].answers, id: \.text) { $answer in
                        Button(action: {
                            if !answer.isSelected {
                                answer.isSelected = true
                                QuizModel.saveQuestionToStorage(fileName: quizFileName, questions: quiz.questions)
                                
                                if answer.isCorrect {
                                    totalScore += quiz.questions[questionIndex].score
                                }
                            }
                        }) {
                            Text(answer.text)
                                .font(.title2) // Testo più grande
                                .frame(maxWidth: .infinity)
                                .padding()
                                .foregroundColor(answer.isSelected ? .white : .black)
                                .background(getButtonColor(answer: answer))
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.orange, lineWidth: 2)
                                )
                        }
                        .disabled(quiz.questions[questionIndex].hasAnswered)
                       //.animation(.easeInOut, value: answer)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                // Navigazione tra domande
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
                        Spacer().frame(width: 120, height: 50)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
            .padding(5)
            .toolbar(.hidden, for: .tabBar)
            .sheet(isPresented: $showHint) {
                HintView(hint: quiz.questions[questionIndex].questionID)
            }
        }
    }
    
    // Funzione per determinare il colore del bottone risposta
    func getButtonColor(answer: AnswerModel) -> Color {
        if answer.isSelected {
            return answer.isCorrect ? Color.green : Color.red
        } else if quiz.questions[questionIndex].hasAnswered {
            if answer.isCorrect {
                return Color.green
            } else {
                return Color.white
            }
        } else{
            return Color.white
        }
    }
    
    func getForegroundColor(answer: AnswerModel) -> Color {
        if answer.isSelected || (answer.isCorrect && quiz.questions[questionIndex].hasAnswered) {
                return Color.white
            } else{
            return Color.black
        }
    }
    
    // Navigazione
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
}

// View per il suggerimento (Hint)
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
            
            Button(action: {
                dismiss()
            }) {
                Text("Chiudi")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(colors: [Color.orange, Color.red],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing))
                    .cornerRadius(10)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Color(.systemGray6)
        )
        .ignoresSafeArea() // Questo fa sì che lo sfondo copra tutta la sheet
    }
}


#Preview {
    QuizView(quizFileName: "strings")
}
