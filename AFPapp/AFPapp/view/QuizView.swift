import SwiftUI

struct QuizView: View {
    
    @State private var totalScore: Int = 0
    @State private var questionIndex: Int = 0
    @State private var selectedAnswer: AnswerModel? = nil
    @State private var quiz: QuizModel = QuizModel(fileName: "control_flow")
    
    var body: some View {
        VStack {
            // Intestazione con numero domanda e stelle
            HStack {
                VStack(alignment: .leading) {
                    /*Text("QUIZ")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundStyle(.primary)
                        .padding(.bottom, 10)*/
                    
                    Text("Question \(questionIndex + 1) of \(quiz.questions.count)")
                        .font(.title2)
                        .foregroundStyle(.primary)
                }
                .padding()
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Button(action: {}) {
                        Image(systemName: "lightbulb.max.fill")
                            .font(.system(size: 25, weight: .bold))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(Color.orange)
                            .padding(.bottom, 10)
                    }
                    HStack {
                        Image(systemName: "star.circle")
                            .font(.system(size: 25))
                            .foregroundStyle(Color.orange)
                        Text("\(totalScore)") // Placeholder, puoi legarlo a una variabile
                            .font(.title3)
                    }
                }
                .padding()
            }
            
            // Sezione domanda
            VStack {
                Text(quiz.questions[questionIndex].question)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.top)
                    .padding(.horizontal)
 
                if quiz.questions[questionIndex].code != "" {
                    ScrollView {
                        Text(quiz.questions[questionIndex].code)
                            .font(.system(size: 16, design: .monospaced)) // Usa font monospaziato per codice
                            .frame(maxWidth: .infinity) // MinHeight maggiore per più spazio
                            .multilineTextAlignment(.leading)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                    }
                    // Definisci un'altezza fissa per la ScrollView
                    .padding()
                }
            }
            .frame(minHeight: 250)
            .background(LinearGradient(colors: [Color.orange, Color.red], startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
            .padding()
            
            Spacer()
            
            VStack (spacing: 20){
                // Bottoni risposte
                ForEach(quiz.questions[questionIndex].answers, id: \.text) { answer in
                    Button(action: {
                        if selectedAnswer == nil {
                            selectedAnswer = answer
                        }
                        if selectedAnswer?.isCorrect == true {
                            totalScore += quiz.questions[questionIndex].score
                        }
                    }) {
                        Text(answer.text)
                            .frame(width: 350, height: 50)
                            .foregroundStyle(getTextColor(answer: answer))
                            .background(getButtonColor(answer: answer))
                    }
                    .buttonStyle(StyleOfButton())
                    .padding(.bottom, 10)
                }
            }
            
            Spacer()
            // Navigazione avanti/indietro
            HStack {
                Button(action: prevQuestion) {
                    Text("Prev.")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 120, height: 50)
                        .background(LinearGradient(colors: [Color(red: 1, green: 0.255, blue: 0.161), Color(red: 0.984, green: 0.639, blue: 0.239)], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(20)
                }
                .disabled(questionIndex == 0)
                
                Spacer()
                
                Button(action: nextQuestion) {
                    Text("Next")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .frame(width: 120, height: 50)
                        .background(LinearGradient(colors: [Color(red: 1, green: 0.255, blue: 0.161), Color(red: 0.984, green: 0.639, blue: 0.239)], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(20)
                }
                .disabled(questionIndex >= quiz.questions.count - 1)
            }
            .padding()
        }
        .toolbar(.hidden, for: .tabBar)// Nasconde la bottom bar
    }

    
    // Funzioni per i colori dei bottoni
    func getButtonColor(answer: AnswerModel) -> Color {
        if selectedAnswer == nil {
            return Color.white
        } else {
            return (selectedAnswer != answer) ? Color.white : answer.isCorrect ? Color.green : Color.red
        }
    }
    
    func getTextColor(answer: AnswerModel) -> Color {
        return selectedAnswer == answer ? .white : .black
    }
    
    // Funzioni per navigazione domande
    func nextQuestion() {
        if questionIndex < quiz.questions.count - 1 {
            questionIndex += 1
            selectedAnswer = nil
        }
    }
    
    func prevQuestion() {
        if questionIndex > 0 {
            questionIndex -= 1
            selectedAnswer = nil
        }
    }
}

#Preview {
    QuizView()
}


struct StyleOfButton: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.title2)
            .fontWeight(.bold)
            .frame(width: 350, height: 50)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.orange, lineWidth: 3)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}
