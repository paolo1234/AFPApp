//
//  QuestionModel.swift
//  AFPapp
//
//  Created by Paolo Calamia on 12/02/25.
//

struct QuestionModel : Codable {
    let questionID: String
    let code: String
    let question: String
    let answers: [AnswerModel]
    let score : Int
}

struct AnswerModel : Codable, Equatable{
    let text: String
    let isCorrect: Bool
}
