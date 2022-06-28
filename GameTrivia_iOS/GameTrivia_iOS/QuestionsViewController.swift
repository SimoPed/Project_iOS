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
    @IBOutlet weak var progressiveBar: UIProgressView!
    @IBOutlet weak var ResultButton: UIButton!
    
    
    var i: Int = 0
    var timer: Timer?
    var generator = [Int]()
    var correctControl: Int = 0

    @IBAction func correctAnswerTapped(_ sender: UIButton) {
        
        if (correctControl == 0){
            firstButtonAnswer.backgroundColor = UIColor.green
            progressiveBar.tintColor = .green
        } else {
            firstButtonAnswer.backgroundColor = UIColor.red
            progressiveBar.tintColor = .red
            switch correctControl {
                case 1:
                    secondButtonAnswer.backgroundColor = UIColor.green
                case 2:
                    thirdButtonAnswer.backgroundColor = UIColor.green
                default:
                    fourthButtonAnswer.backgroundColor = UIColor.green
                }
            sender.shake()
        }

        
        firstButtonAnswer.isEnabled = false
        secondButtonAnswer.isEnabled = false
        thirdButtonAnswer.isEnabled = false
        fourthButtonAnswer.isEnabled = false
        i = i + 1
        
       
        progress()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.musicQuestions(number: self.i, generator: self.generator, correctControl: self.correctControl)
        }
    }
    
    @IBAction func wrongOneAnswerTapped(_ sender: UIButton) {
        
        if (correctControl == 1){
            secondButtonAnswer.backgroundColor = UIColor.green
            progressiveBar.tintColor = .green
        } else {
            secondButtonAnswer.backgroundColor = UIColor.red
            progressiveBar.tintColor = .red
            switch correctControl {
                case 0:
                    firstButtonAnswer.backgroundColor = UIColor.green
                case 2:
                    thirdButtonAnswer.backgroundColor = UIColor.green
                default:
                    fourthButtonAnswer.backgroundColor = UIColor.green
                }
            sender.shake()
        }
        
        firstButtonAnswer.isEnabled = false
        secondButtonAnswer.isEnabled = false
        thirdButtonAnswer.isEnabled = false
        fourthButtonAnswer.isEnabled = false
        i = i + 1
        
        progress()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.musicQuestions(number: self.i, generator: self.generator, correctControl: self.correctControl)
        }
    }
    
    
    @IBAction func wrongTwoAnswerTapped(_ sender: UIButton) {
        
        if (correctControl == 2){
            thirdButtonAnswer.backgroundColor = UIColor.green
            progressiveBar.tintColor = .green
        } else {
            thirdButtonAnswer.backgroundColor = UIColor.red
            progressiveBar.tintColor = .red
            switch correctControl {
                case 0:
                    firstButtonAnswer.backgroundColor = UIColor.green
                case 1:
                    secondButtonAnswer.backgroundColor = UIColor.green
                default:
                    fourthButtonAnswer.backgroundColor = UIColor.green
                }
            sender.shake()
        }

        firstButtonAnswer.isEnabled = false
        secondButtonAnswer.isEnabled = false
        thirdButtonAnswer.isEnabled = false
        fourthButtonAnswer.isEnabled = false
        i = i + 1
        
        progress()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.musicQuestions(number: self.i, generator: self.generator, correctControl: self.correctControl)
        }
    }
    
    @IBAction func wrongThreeAnswerTapped(_ sender: UIButton) {
        
        if (correctControl == 3){
            fourthButtonAnswer.backgroundColor = UIColor.green
            progressiveBar.tintColor = .green
        } else {
            fourthButtonAnswer.backgroundColor = UIColor.red
            progressiveBar.tintColor = .red
            switch correctControl {
                case 0:
                    firstButtonAnswer.backgroundColor = UIColor.green
                case 1:
                    secondButtonAnswer.backgroundColor = UIColor.green
                default:
                    thirdButtonAnswer.backgroundColor = UIColor.green
                }
            sender.shake()
        }

        firstButtonAnswer.isEnabled = false
        secondButtonAnswer.isEnabled = false
        thirdButtonAnswer.isEnabled = false
        fourthButtonAnswer.isEnabled = false
        i = i + 1
        
        progress()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.musicQuestions(number: self.i, generator: self.generator, correctControl: self.correctControl)
        }
    }
    
    let database = Firestore.firestore()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        generator = randomNumber()
        ResultButton.charButton()
        ResultButton.isHidden = true
        ResultButton.isEnabled = false
        firstButtonAnswer.questionButton()
        secondButtonAnswer.questionButton()
        thirdButtonAnswer.questionButton()
        fourthButtonAnswer.questionButton()
        musicQuestions(number: i, generator: self.generator, correctControl: self.correctControl)
    }
    

    
    func progress() {
        progressiveBar.isHidden = false
        var progress: Float = 0.0
        progressiveBar.progress = progress
        
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.015, repeats: true, block: {(timer) in
            progress += 0.01
            self.progressiveBar.progress = progress
            if self.progressiveBar.progress  == 1.0{
                self.progressiveBar.progress = 0.0
            }
        })
    }
    
    
    func musicQuestions(number: Int, generator: [Int], correctControl: Int) {
        progressiveBar.isHidden = true
               if number < 10 {
                   firstButtonAnswer.isEnabled = true
                   secondButtonAnswer.isEnabled = true
                   thirdButtonAnswer.isEnabled = true
                   fourthButtonAnswer.isEnabled = true
                   firstButtonAnswer.backgroundColor = UIColor.white
                   secondButtonAnswer.backgroundColor = UIColor.white
                   thirdButtonAnswer.backgroundColor = UIColor.white
                   fourthButtonAnswer.backgroundColor = UIColor.white
                   let readDoc = database.collection("music").getDocuments() {(querySnapshot, err) in
                       var dati = querySnapshot!.documents[generator[number]].data()
                       self.questionLabel.text = dati["question"] as! String
                       
                       var randomCorrect = Int.random(in: 0..<4)
                       switch randomCorrect {
                       case 0:
                           self.firstButtonAnswer.setTitle(dati["answerCorrect"] as! String, for: .normal)
                           self.secondButtonAnswer.setTitle(dati["answerOne"] as! String, for: .normal)
                           self.thirdButtonAnswer.setTitle(dati["answerTwo"] as! String, for: .normal)
                           self.fourthButtonAnswer.setTitle(dati["answerThree"] as! String, for: .normal)
                           self.correctControl = 0
                           
                       case 1:
                           self.firstButtonAnswer.setTitle(dati["answerOne"] as! String, for: .normal)
                           self.secondButtonAnswer.setTitle(dati["answerCorrect"] as! String, for: .normal)
                           self.thirdButtonAnswer.setTitle(dati["answerThree"] as! String, for: .normal)
                           self.fourthButtonAnswer.setTitle(dati["answerTwo"] as! String, for: .normal)
                           self.correctControl = 1
                           
                       case 2:
                           self.firstButtonAnswer.setTitle(dati["answerThree"] as! String, for: .normal)
                           self.secondButtonAnswer.setTitle(dati["answerTwo"] as! String, for: .normal)
                           self.thirdButtonAnswer.setTitle(dati["answerCorrect"] as! String, for: .normal)
                           self.fourthButtonAnswer.setTitle(dati["answerOne"] as! String, for: .normal)
                           self.correctControl = 2
                           
                       default:
                           self.firstButtonAnswer.setTitle(dati["answerTwo"] as! String, for: .normal)
                           self.secondButtonAnswer.setTitle(dati["answerThree"] as! String, for: .normal)
                           self.thirdButtonAnswer.setTitle(dati["answerOne"] as! String, for: .normal)
                           self.fourthButtonAnswer.setTitle(dati["answerCorrect"] as! String, for: .normal)
                           self.correctControl = 3
                       }
                   }
               } else {
                   ResultButton.isHidden = false
                   ResultButton.isEnabled = true
               }
           }
           
           func randomNumber() -> [Int] {
               var numberRandom = [Int]()
               
               let lower = UInt32(0)
               let higher = UInt32(10)
               
               while numberRandom.count != 10 {
                   let number = arc4random_uniform(higher - lower) + lower
                   if !numberRandom.contains(Int(number)) {
                       numberRandom.append(Int(number))
                   }
               }
               return numberRandom
           }
    
    
    
//    func delay(i: Int) {
//        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(musicQuestions(number: i)), userInfo: nil, repeats: false)
//    }
    
}

