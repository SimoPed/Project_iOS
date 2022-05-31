//
//  ViewController.swift
//  GameTrivia_iOS
//
//  Created by Simone Pedrini on 31/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.cornerRadius = 10
        startButton.layer.shadowOpacity = 0.5
        startButton.layer.shadowRadius = 0.0
        startButton.layer.masksToBounds = false
        startButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    }
    
    //nascondere il back nella navigation item
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "switch" {
            let vc = segue.destination
            vc.navigationItem.hidesBackButton = true
        }
    }
}

