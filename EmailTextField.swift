//
//  EmailTextField.swift
//  CKDODesign
//
//  Created by Hollis Edwards on 2/22/17.
//  Copyright © 2017 Hollis Edwards. All rights reserved.
//

import UIKit
import Firebase

@IBDesignable
class EmailTextField: UITextField {
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.borderColor = UIColor(white: 231 / 255, alpha: 1).cgColor
        self.layer.borderWidth = 1
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 8, dy: 7)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }
    
}
