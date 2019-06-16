//
//  RegistrationViewController+TextField.swift
//  Instalook-User
//
//  Created by Amer Shaker on 6/14/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

extension RegistationViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
