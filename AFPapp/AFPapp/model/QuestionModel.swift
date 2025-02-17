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
    var answers: [AnswerModel]
    let score : Int
    var hasAnswered: Bool {
        return answers.contains(where: { $0.isSelected })
    }
}

struct AnswerModel : Codable, Equatable{
    let text: String
    let isCorrect: Bool
    var isSelected: Bool = false
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decode(String.self, forKey: .text)
        self.isCorrect = try container.decode(Bool.self, forKey: .isCorrect)
        self.isSelected = try container.decodeIfPresent(Bool.self, forKey: .isSelected) ?? false
    }
}
