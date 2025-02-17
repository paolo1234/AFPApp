//
//  TheoryModel.swift
//  AFPapp
//
//  Created by Bernardo Macaluso on 16/02/25.
//

import Foundation

struct TheoryModel: Codable, Identifiable {
    var id: Int { lessonID }
    let lessonID: Int
    var currentStep: Int
    var theoryProgress: Double
}
