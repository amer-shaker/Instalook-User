//
//  LoginViewController+TextField.swift
//  Instalook-User
//
//  Created by Amer Shaker on 6/14/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

extension UITextField {
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
}
