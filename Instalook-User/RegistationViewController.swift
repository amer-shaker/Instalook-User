//
//  RegistationViewController.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import UIKit

class RegistationViewController: UIViewController, RegistrationView {
    
    // MARK: Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    private var presenter: RegistrationPresenter!
    private var firstName: String!
    private var lastName: String!
    private var email: String!
    private var password: String!
    
    // MARK: View life cycle
    override func viewDidLoad() {
        presenter = RegistrationPresenter(view: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    // MARK: Registration View methods
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    func register() -> Bool {
        return false
    }
    
    func success() {
        print("Success")
    }
    
    func failed() {
        print("FF")
    }
    
    // MARK: Actions
    @IBAction func register(_ sender: UIButton) {
        firstName = firstNameTextField.text
        lastName = lastNameTextField.text
        email = emailTextField.text
        password = passwordTextField.text
        
        presenter.register(firstName: firstName,
                           lastName: lastName,
                           email: email,
                           password: password,
                           confirmPassword: confirmPasswordTextField.text!)
    }
    
    @IBAction func dismissViewController(_ sender: UISwipeGestureRecognizer) {
        sender.direction = UISwipeGestureRecognizerDirection.left
        self.dismiss(animated: true, completion: nil)
    }
}
