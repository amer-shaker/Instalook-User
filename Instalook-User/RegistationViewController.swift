//
//  RegistationViewController.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import UIKit

class RegistationViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    private var presenter: RegistrationPresenter!

    
    // MARK: View life cycle
    override func viewDidLoad() {
        presenter = RegistrationPresenter(view: self)
    }

    // MARK: Actions
    @IBAction func register(_ sender: UIButton) {
        presenter.register(firstName: firstNameTextField.text!,
                           lastName: lastNameTextField.text!,
                           email: emailTextField.text!,
                           password: passwordTextField.text!,
                           confirmPassword: confirmPasswordTextField.text!)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        firstNameTextField.resignFirstResponder()
        lastNameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        confirmPasswordTextField.resignFirstResponder()
    }
    
    @IBAction func dismissViewController(_ sender: UISwipeGestureRecognizer) {
        sender.direction = UISwipeGestureRecognizerDirection.left
        self.dismiss(animated: true, completion: nil)
    }
}
