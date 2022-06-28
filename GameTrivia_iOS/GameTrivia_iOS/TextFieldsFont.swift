//
//  TextFieldsFont.swift
//  GameTrivia_iOS
//
//  Created by Nicolò Frighi on 28/06/22.
//

import Foundation

import UIKit

extension UILabel {
    
    open override func awakeFromNib() {
        self.font = self.font.withSize(self.font.pointSize.relativeToIphone8Width())
    }
    
}

extension UITextView {
    
    open override func awakeFromNib() {
        self.font = self.font?.withSize((self.font?.pointSize.relativeToIphone8Width())!)
    }
    
}

extension UITextField {
    
    open override func awakeFromNib() {
        self.font = self.font?.withSize((self.font?.pointSize.relativeToIphone8Width())!)
    }
    
}

extension UIButton {
    
    open override func awakeFromNib() {
        self.titleLabel?.font = self.titleLabel?.font.withSize((self.titleLabel?.font.pointSize.relativeToIphone8Width())!)
    }
    
}
