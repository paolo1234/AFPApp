//
//  QuizProgressService.swift
//  AFPapp
//
//  Created by Paolo Calamia on 13/02/25.
//

import Foundation

import Foundation

class QuizProgressService {
    /// Calcola il progresso del quiz per il file specificato
    /// - Parameter fileName: il nome del file del quiz
    /// - Returns: il progresso del quiz come valore compreso tra 0.0 e 1.0
    static func calculateQuizProgress(for fileName: String) -> Double {
        let quizModel = QuizModel(fileName: fileName)
        let totalQuestions = quizModel.questions.count
        guard totalQuestions > 0 else { return 0.0 }
        // Calcola quante domande sono state risposte
        let answeredQuestions = quizModel.questions.filter { $0.answeredCorrectly }.count
        return Double(answeredQuestions) / Double(totalQuestions)
    }
}
