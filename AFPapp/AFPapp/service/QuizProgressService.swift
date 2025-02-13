//
//  QuizProgressService.swift
//  AFPapp
//
//  Created by Paolo Calamia on 13/02/25.
//

import Foundation

struct QuizProgress {
    var quizes: [QuizModel?]
    
    init(quizes: [QuizModel?]) {
        let quiz1 = QuizModel(fileName: "control_flow")
        let quiz2 = QuizModel(fileName: "strings")
        let quiz3 = QuizModel(fileName: "varconstdata")

        self.quizes = [quiz1, quiz2, quiz3]
    }
    
}

struct QuizProgressService {

    /*
    func originalPhotos() -> [Photo] {
        return [Photo(title: "Bari", file: "bari"), Photo(title: "Firenze", file: "firenze"), Photo(title: "Genova", file: "genova"), Photo(title: "Napoli", file: "napoli"),Photo(title: "Palermo", file: "palermo"),Photo(title: "Roma", file: "roma")]
    }
    
    func loadPhotos() -> [Photo] {
        if let data = UserDefaults.standard.object(forKey: "photos"){
            do{
                let decoder = JSONDecoder()
                let p = try decoder.decode([Photo].self, from: data as! Data)
                return p
            } catch {
                print("Unable to decode (\(error))")
            }
        }
        return originalPhotos()
    }
    
    func savePhotos(photos: [Photo]) {
        do{
            let data = try JSONEncoder().encode(photos)
            UserDefaults.standard.set(data, forKey: "photos")
        } catch {
            print("Unable to save: (\(error))")
        }
    }*/
}
