import Foundation

struct QuizModel {
    var questions: [QuestionModel]
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
        do {
            let questionsData = try jsonDecoder.decode([QuestionModel].self, from: data)
            return questionsData
        } catch {
            print("Errore nella decodifica del JSON dal file \(fileName).json: \(error)")
            return []
        }
    }
    
    static func loadQuestionFromStorage(fileName: String) -> [QuestionModel]? {
        if let data = UserDefaults.standard.object(forKey: fileName){
            do{
                let decoder = JSONDecoder()
                let p = try decoder.decode([QuestionModel].self, from: data as! Data)
                return p
            } catch {
                print("Unable to decode (\(error))")
            }
        }
        return nil
    }
    
    static func saveQuestionToStorage(fileName: String, questions: [QuestionModel]) {
        //print(questions)
        //print(fileName)
        //UserDefaults.standard.set(questions, forKey: fileName)
        
        do{
            let data = try JSONEncoder().encode(questions)
            UserDefaults.standard.set(data, forKey: fileName)
        } catch {
            print("Unable to save: (\(error))")
        }
    }
    
    /// Inizializza il modello caricando le domande dal file JSON specificato.
    init(fileName: String) {
        self.fileName = fileName
        if let questionsData = QuizModel.loadQuestionFromStorage(fileName: fileName) {
            self.questions = questionsData
        }else {
            self.questions = QuizModel.loadQuestionsFromJSONfile(fileName: fileName)
        }
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
