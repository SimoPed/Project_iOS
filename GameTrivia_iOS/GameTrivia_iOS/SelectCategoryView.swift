//
//  SelectCategoryView.swift
//  GameTrivia_iOS
//
//  Created by Simone Pedrini on 31/05/22.
//

import UIKit

class SelectCategoryView: UIViewController {
    @IBOutlet weak var musicButton: UIButton!
    @IBOutlet weak var mythologyButton: UIButton!
    @IBOutlet weak var videogamesButton: UIButton!
    @IBOutlet weak var filmButton: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var vehiclesButton: UIButton!
    @IBOutlet weak var allcategoriesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        musicButton.charButton()
//        mythologyButton.charButton()
//        videogamesButton.charButton()
//        filmButton.charButton()
//        sportsButton.charButton()
//        vehiclesButton.charButton()
//        allcategoriesButton.charButton()
    }
    
}
