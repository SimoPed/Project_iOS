//
//  QuestionsViewController.swift
//  GameTrivia_iOS
//
//  Created by Simone Pedrini on 07/06/22.
//

import UIKit
import Foundation

class QuestionsViewController: UIViewController {
    
    struct Music: Codable {
        var question: String
        var correct_answer: String
        var incorrect_answers: [String]
    }
    
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
        musicQuestions()
    }
    
    
    func musicQuestions(completionHandler: @escaping ([Music]) -> Void) {
        let url = URL(string: "https://opentdb.com/api.php?amount=10&category=12&difficulty=easy")!
//        let data = try! Data(contentsOf: url)
//        do {
//            let decoder: JSONDecoder = JSONDecoder.init()
//            let user: Music = try decoder.decode(Music.self, from: data)
//
//            print("Dio bastardo \(user.question)")
//        } catch _ {
//            print("Dio madonna")
//        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
              if let error = error {
                print("Error with fetching films: \(error)")
                return
              }
              
              guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response)")
                return
              }

              if let data = data,
                let musicSummary = try? JSONDecoder().decode(Music.self, from: data) {
//                completionHandler(musicSummary.question ?? [])
              }
            })
            task.resume()
        
    }
    
}
