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
        startButton.charButton()
        
    }
    
    //nascondere il back nella navigation item
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "switch" {
            let vc = segue.destination
            vc.navigationItem.hidesBackButton = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension UIButton {
    func charButton() {
        self.layer.cornerRadius = 10
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 0.0
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    }
    
    func questionButton() {
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 0.0
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
}
