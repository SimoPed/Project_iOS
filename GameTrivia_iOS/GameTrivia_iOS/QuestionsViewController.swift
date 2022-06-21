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
    
    var i: Int = 0

    @IBAction func correctAnswerTapped(_ sender: UIButton) {
        firstButtonAnswer.backgroundColor = UIColor.green
        firstButtonAnswer.isEnabled = false
        secondButtonAnswer.isEnabled = false
        thirdButtonAnswer.isEnabled = false
        fourthButtonAnswer.isEnabled = false
        i = i + 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.musicQuestions(number: self.i)
        }

    }
    
    @IBAction func wrongOneAnswerTapped(_ sender: UIButton) {
        secondButtonAnswer.backgroundColor = UIColor.red
        firstButtonAnswer.backgroundColor = UIColor.green
        sender.shake()
        firstButtonAnswer.isEnabled = false
        secondButtonAnswer.isEnabled = false
        thirdButtonAnswer.isEnabled = false
        fourthButtonAnswer.isEnabled = false
        i = i + 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.musicQuestions(number: self.i)
        }
    }
    
    
    @IBAction func wrongTwoAnswerTapped(_ sender: UIButton) {
        thirdButtonAnswer.backgroundColor = UIColor.red
        firstButtonAnswer.backgroundColor = UIColor.green
        sender.shake()
        firstButtonAnswer.isEnabled = false
        secondButtonAnswer.isEnabled = false
        thirdButtonAnswer.isEnabled = false
        fourthButtonAnswer.isEnabled = false
        i = i + 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.musicQuestions(number: self.i)
        }
    }
    
    @IBAction func wrongThreeAnswerTapped(_ sender: UIButton) {
        fourthButtonAnswer.backgroundColor = UIColor.red
        firstButtonAnswer.backgroundColor = UIColor.green
        sender.shake()
        firstButtonAnswer.isEnabled = false
        secondButtonAnswer.isEnabled = false
        thirdButtonAnswer.isEnabled = false
        fourthButtonAnswer.isEnabled = false
        i = i + 1
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.musicQuestions(number: self.i)
        }
    }
    
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        firstButtonAnswer.questionButton()
        secondButtonAnswer.questionButton()
        thirdButtonAnswer.questionButton()
        fourthButtonAnswer.questionButton()
        musicQuestions(number: i)
    }
    
    
    func musicQuestions(number: Int) {
    
        firstButtonAnswer.isEnabled = true
        secondButtonAnswer.isEnabled = true
        thirdButtonAnswer.isEnabled = true
        fourthButtonAnswer.isEnabled = true
        firstButtonAnswer.backgroundColor = UIColor.white
        secondButtonAnswer.backgroundColor = UIColor.white
        thirdButtonAnswer.backgroundColor = UIColor.white
        fourthButtonAnswer.backgroundColor = UIColor.white
        let readDoc = database.collection("music").getDocuments() {(querySnapshot, err) in
            var dati = querySnapshot!.documents[number].data()
            self.questionLabel.text = dati["question"] as! String
            self.firstButtonAnswer.setTitle(dati["answerCorrect"] as! String, for: .normal)
            self.secondButtonAnswer.setTitle(dati["answerOne"] as! String, for: .normal)
            self.thirdButtonAnswer.setTitle(dati["answerTwo"] as! String, for: .normal)
            self.fourthButtonAnswer.setTitle(dati["answerThree"] as! String, for: .normal)
            
        }
    
    }
    
//    func delay(i: Int) {
//        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(musicQuestions(number: i)), userInfo: nil, repeats: false)
//    }
    
}

