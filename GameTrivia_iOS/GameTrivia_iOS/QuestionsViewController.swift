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
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstButtonAnswer: UIButton!
    @IBOutlet weak var secondButtonAnswer: UIButton!
    @IBOutlet weak var thirdButtonAnswer: UIButton!
    @IBOutlet weak var fourthButtonAnswer: UIButton!
    

    @IBAction func correctAnswerTapped(_ sender: UIButton) {
        firstButtonAnswer.backgroundColor = UIColor.green
    }
    
    @IBAction func wrongOneAnswerTapped(_ sender: UIButton) {
        secondButtonAnswer.backgroundColor = UIColor.red
        firstButtonAnswer.backgroundColor = UIColor.green
               sender.shake()
           }
    
    
    @IBAction func wrongTwoAnswerTapped(_ sender: UIButton) {
        thirdButtonAnswer.backgroundColor = UIColor.red
        firstButtonAnswer.backgroundColor = UIColor.green
        sender.shake()
    }
    
    @IBAction func wrongThreeAnswerTapped(_ sender: UIButton) {
        fourthButtonAnswer.backgroundColor = UIColor.red
        firstButtonAnswer.backgroundColor = UIColor.green
        sender.shake()
    }
    
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        firstButtonAnswer.questionButton()
        secondButtonAnswer.questionButton()
        thirdButtonAnswer.questionButton()
        fourthButtonAnswer.questionButton()
        musicQuestions()
    }
    
    
    func musicQuestions() {
        let readDoc = database.collection("music").getDocuments() {(querySnapshot, err) in
            var dati = querySnapshot!.documents[0].data()
            self.questionLabel.text = dati["question"] as! String
            self.firstButtonAnswer.setTitle(dati["answerCorrect"] as! String, for: .normal)
            self.secondButtonAnswer.setTitle(dati["answerOne"] as! String, for: .normal)
            self.thirdButtonAnswer.setTitle(dati["answerTwo"] as! String, for: .normal)
            self.fourthButtonAnswer.setTitle(dati["answerThree"] as! String, for: .normal)
            
        }
    
    }
    
}

