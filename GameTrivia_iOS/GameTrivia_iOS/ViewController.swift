//
//  ViewController.swift
//  GameTrivia_iOS
//
//  Created by Simone Pedrini on 31/05/22.
//
import Foundation

import UIKit
import FirebaseStorage

let minScalableValue: CGFloat = 8.0 // Min value that should undergo upper scaling for bigger iphones and iPads
extension CGFloat {
    
    func relativeToIphone8Width(shouldUseLimit: Bool = true) -> CGFloat {
        let upperScaleLimit: CGFloat = 1.8
        var toUpdateValue = floor(self * (UIScreen.main.bounds.width / 400))
        guard self > minScalableValue else {return toUpdateValue}
        guard shouldUseLimit else {return toUpdateValue}
        guard upperScaleLimit > 1 else {return toUpdateValue}
        let limitedValue = self * upperScaleLimit
        if toUpdateValue > limitedValue {
            toUpdateValue = limitedValue
        }
        return toUpdateValue
    }
    
    func relativeToIphone8Height(shouldUseLimit: Bool = true) -> CGFloat {
        var extraHeight: CGFloat = 0
        if #available(iOS 11.0, *) {
            extraHeight = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            extraHeight = extraHeight + (UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 20) - 20
        }
        let upperScaleLimit: CGFloat = 1.8
        var toUpdateValue = floor(self * ((UIScreen.main.bounds.height - extraHeight) / 667))
        guard self > minScalableValue else {return toUpdateValue}
        guard shouldUseLimit else {return toUpdateValue}
        guard upperScaleLimit > 1 else {return toUpdateValue}
        let limitedValue = self * upperScaleLimit
        if toUpdateValue > limitedValue {
            toUpdateValue = limitedValue
        }
        return toUpdateValue
    }
    
}

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.charButton()
//        let img:UIImage = UIImage(named: "Martinetti.png") ?? UIImage()
//        imageView.image = img
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
    
    func shake() {
           let shake = CABasicAnimation(keyPath: "position")
           shake.duration = 0.1
           shake.repeatCount = 2
           shake.autoreverses = true

           let daPunto = CGPoint(x: center.x - 5, y: center.y)
           let daValore = NSValue(cgPoint: daPunto)
           shake.fromValue = daValore

           let toPunto = CGPoint(x: center.x + 5, y: center.y)
           let toValore = NSValue(cgPoint: toPunto)
           shake.toValue = toValore
           layer.add(shake, forKey: nil)
       }
}
