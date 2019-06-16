//
//  RegistrationViewController+RegistrationDelegate.swift
//  Instalook-User
//
//  Created by Amer Shaker on 6/2/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

extension RegistationViewController: RegistrationView {
    
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    func registrationSuccess() {
        dismiss(animated: true, completion: nil)
    }
    
    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
    }
}
