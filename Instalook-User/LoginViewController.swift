//
//  LoginViewController.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginView {
    
    // MARK: Outlets
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private var presenter: LoginPresenter!
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
    }
    
    func successfullLogin() {
        print("login success")
    }
    
    func failedLogin() {
        print("login failed")
    }
    
    @IBAction func login(_ sender: UIButton) {
        presenter.login(email: emailTextField.text!, password: passwordTextField.text!)
    }
}
