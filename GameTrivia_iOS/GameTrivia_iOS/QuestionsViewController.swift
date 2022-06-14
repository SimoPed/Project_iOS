//
//  QuestionsViewController.swift
//  GameTrivia_iOS
//
//  Created by Simone Pedrini on 07/06/22.
//

import UIKit
import Foundation
import Firebase

class QuestionsViewController: UIViewController {
    
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        musicQuestions()
    }
    
    
    func musicQuestions() {
        let readDoc = database.collection("music").getDocuments() {(querySnapshot, err) in
            if let err = err {
                print("Error")
            } else {
//                for document in querySnapshot!.documents {
//                print("\(querySnapshot?.documents[0].documentID) => \(querySnapshot?.documents[0].data())")
//                }
                var dati = querySnapshot?.documents[0].data()
                print(dati)
            }
        }
    
    }
    
}
