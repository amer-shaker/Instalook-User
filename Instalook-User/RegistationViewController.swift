//
//  RegistationViewController.swift
//  Instalook-User
//
//  Created by Amer Shaker on 5/31/19.
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
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: RegistrationPresenter!

    
    // MARK: View life cycle
    override func viewDidLoad() {
        configureLoginButton()
        presenter = RegistrationPresenter(view: self)
    }

    // MARK: Actions
    @IBAction func register(_ sender: UIButton) {
        
        guard let firstName = firstNameTextField.text,
            let lastName = lastNameTextField.text,
            let email = emailTextField.text,
            let password = passwordTextField.text,
            let confirmPassword = confirmPasswordTextField.text else { return }
        
        presenter.register(firstName: firstName,
                           lastName: lastName,
                           email: email,
                           password: password,
                           confirmPassword: confirmPassword)
    }
    
    @IBAction func login(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func dismissViewController(_ sender: UISwipeGestureRecognizer) {
        sender.direction = UISwipeGestureRecognizerDirection.left
        dismiss(animated: true, completion: nil)
    }
    
    private func configureLoginButton() {
        let partOneForegroundColor = UIColor(colorLiteralRed: 255, green: 255, blue: 255, alpha: 0.6)
        
        let partOneAttributes = [NSForegroundColorAttributeName: partOneForegroundColor,
                                 NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        let partTwoAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                 NSFontAttributeName: UIFont.boldSystemFont(ofSize: 15)]
        
        let partOne = NSMutableAttributedString(string: "Already have an account? ",
                                                attributes: partOneAttributes)
        let partTwo = NSMutableAttributedString(string: "Login",
                                                attributes: partTwoAttributes)
        
        let title = NSMutableAttributedString()
        title.append(partOne)
        title.append(partTwo)
        
        loginButton.setAttributedTitle(title, for: .normal)
    }
}
