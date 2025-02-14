import Foundation

struct QuizModel {
    let questions: [QuestionModel]
    let fileName: String
    
    /// Carica le domande da un file JSON presente nel bundle.
    static func loadQuestionsFromJSONfile(fileName: String) -> [QuestionModel] {
        // Cerca il file JSON nel bundle
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            print("Errore: file \(fileName).json non trovato")
            return []
        }
        
        // Prova a caricare i dati e decodificarli; se qualcosa va storto, restituisce un array vuoto
        guard let data = try? Data(contentsOf: fileURL) else {
            print("Errore: impossibile caricare i dati dal file \(fileName).json")
            return []
        }
        
        let jsonDecoder = JSONDecoder()
        guard let questionsData = try? jsonDecoder.decode([QuestionModel].self, from: data) else {
            print("Errore: impossibile decodificare il JSON dal file \(fileName).json")
            return []
        }
        
        return questionsData
    }
    
    /// Inizializza il modello caricando le domande dal file JSON specificato.
    init(fileName: String) {
        self.fileName = fileName
        self.questions = QuizModel.loadQuestionsFromJSONfile(fileName: fileName)
    }
    
    /// Stampa tutte le domande con le rispettive risposte per il debug.
    func printQuestions() {
        if questions.isEmpty {
            print("Nessuna domanda disponibile.")
        } else {
            for (index, question) in questions.enumerated() {
                print("\nDomanda \(index + 1): \(question.question)")
                
                for (answerIndex, answer) in question.answers.enumerated() {
                    let correctness = answer.isCorrect ? "(CORRETTA)" : "(SBAGLIATA)"
                    print("  \(answerIndex + 1). \(answer.text) \(correctness)")
                }
            }
        }
    }
}
