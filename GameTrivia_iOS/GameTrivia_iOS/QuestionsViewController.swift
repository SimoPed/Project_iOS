//
//  QuestionsViewController.swift
//  GameTrivia_iOS
//
//  Created by Simone Pedrini on 07/06/22.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super .viewDidLoad()
    }
    
    let url = URL(string: "https://opentdb.com/api.php?amount=10&category=12&difficulty=easy&encode=base64")
}
