//
//  StackViewExtension.swift
//  GameTrivia_iOS
//
//  Created by Nicolò Frighi on 28/06/22.
//

import Foundation

import UIKit

extension UIStackView {
    
    open override func awakeFromNib() {
        if self.axis == .horizontal {
            self.spacing = self.spacing.relativeToIphone8Width()
        } else {
            self.spacing = self.spacing.relativeToIphone8Height()
        }
        self.layoutIfNeeded()
    }
    
}
