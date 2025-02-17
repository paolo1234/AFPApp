//
//  TheoryViewModel.swift
//  AFPapp
//
//  Created by Bernardo Macaluso on 16/02/25.
//

import Foundation

class TheoryViewModel: ObservableObject {
    @Published var theoryList: [TheoryModel] =
    [TheoryModel(lessonID: 1, currentStep: 1, theoryProgress: 0.0),
    TheoryModel(lessonID: 2, currentStep: 1, theoryProgress: 0.0),
    TheoryModel(lessonID: 3, currentStep: 1, theoryProgress: 0.0),
    TheoryModel(lessonID: 4, currentStep: 1, theoryProgress: 0.0),
    TheoryModel(lessonID: 5, currentStep: 1, theoryProgress: 0.0),
    TheoryModel(lessonID: 6, currentStep: 1, theoryProgress: 0.0)]
    
    init() {
        self.loadTheoryProgress()
    }
    
    func updateCurrentStep(lessonID: Int, add: Bool, sub: Bool, numberOfSteps: Int) {
        if let index = theoryList.firstIndex(where: { $0.lessonID == lessonID }) {
            if (add) {
                theoryList[index].currentStep += 1
                theoryList[index].theoryProgress = Double(theoryList[index].currentStep) / Double(numberOfSteps)
            } else if (sub) {
                theoryList[index].currentStep -= 1
                theoryList[index].theoryProgress = Double(theoryList[index].currentStep) / Double(numberOfSteps)
            }
            saveTheoryProgress()
        }
    }
    
    /* func updateEndLesson(lessonID: Int, numberOfSteps: Int) {
        if let index = theoryList.firstIndex(where: { $0.lessonID == lessonID }) {
            theoryList[index].currentStep = numberOfSteps
            theoryList[index].theoryProgress = 1
            saveTheoryProgress()
        }
    } */
    
    func saveTheoryProgress() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(theoryList) {
            UserDefaults.standard.set(encoded, forKey: "theoryList")
        }
    }
    
    func loadTheoryProgress() {
        if let savedData = UserDefaults.standard.data(forKey: "theoryList") {
            do{
                let decoder = JSONDecoder()
                let p = try decoder.decode([TheoryModel].self, from: savedData as! Data)
                self.theoryList = p
            } catch {
                print("Unable to decode (\(error))")
            }
        } else {
            self.theoryList =
            [TheoryModel(lessonID: 1, currentStep: 1, theoryProgress: 0.0),
             TheoryModel(lessonID: 2, currentStep: 1, theoryProgress: 0.0),
             TheoryModel(lessonID: 3, currentStep: 1, theoryProgress: 0.0),
             TheoryModel(lessonID: 4, currentStep: 1, theoryProgress: 0.0),
             TheoryModel(lessonID: 5, currentStep: 1, theoryProgress: 0.0),
             TheoryModel(lessonID: 6, currentStep: 1, theoryProgress: 0.0)]
        }
    }
    
    func resetTheoryProgress() {
        UserDefaults.standard.removeObject(forKey: "theoryList")
        loadTheoryProgress()
    }
}
