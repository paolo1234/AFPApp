//
//  TheoryViewModel.swift
//  AFPapp
//
//  Created by Bernardo Macaluso on 16/02/25.
//

import Foundation
import Firebase

class TheoryViewModel: ObservableObject {
    @Published var theoryList: [TheoryModel] =
    [TheoryModel(lessonID: 1, currentStep: 1, theoryProgress: 0.0),
    TheoryModel(lessonID: 2, currentStep: 1, theoryProgress: 0.0),
    TheoryModel(lessonID: 3, currentStep: 1, theoryProgress: 0.0),
    TheoryModel(lessonID: 4, currentStep: 1, theoryProgress: 0.0),
    TheoryModel(lessonID: 5, currentStep: 1, theoryProgress: 0.0),
    TheoryModel(lessonID: 6, currentStep: 1, theoryProgress: 0.0)]
    
    private var timer: Timer?
    
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
    
    func syncTheoryProgressToFirebase() {
        let db = Firestore.firestore()
        for theoryItem in theoryList {
            do {
                let data = try JSONEncoder().encode(theoryItem)
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    db.collection("theoryList").document(theoryItem.firebaseID).setData(json) { error in
                        if let error = error {
                            print("Error updating theory progress: \(error)")
                        } else {
                            print("Theory progress successfully updated")
                        }
                    }
                }
            } catch {
                print("Unable to encode progress item: \(error)")
            }
        }
    }
    
    func fetchProgressFromFirebase() {
        let db = Firestore.firestore()
        db.collection("theoryList").getDocuments { (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("No documents")
                return
            }

            self.theoryList = documents.compactMap { doc -> TheoryModel? in
                return try? doc.data(as: TheoryModel.self)
            }
            self.saveTheoryProgress()
        }
    }
    
    func startSyncTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 100, repeats: true) { [weak self] _ in self?.syncTheoryProgressToFirebase()
        }
    }
    
    func stopSyncTimer() {
        timer?.invalidate()
    }
    
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
                let p = try decoder.decode([TheoryModel].self, from: savedData as Data)
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
