//
//  LoginViewController.swift
//  Instalook-User
//
//  Created by Amer Shaker on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var presenter: LoginPresenter!
    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRegisterButton()
        presenter = LoginPresenter(view: self)
    }
    
    // MARK: Action
    @IBAction func login(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        presenter.login(email: email, password: password)
    }
    
    @IBAction func register(_ sender: UIButton) {
        let registationViewController = storyboard?.instantiateViewController(withIdentifier: "RegistationViewController") as! RegistationViewController
        present(registationViewController, animated: true, completion: nil)
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func configureRegisterButton() {
        let partOneForegroundColor = UIColor(colorLiteralRed: 255, green: 255, blue: 255, alpha: 0.6)
        
        let partOneAttributes = [NSForegroundColorAttributeName: partOneForegroundColor,
                                 NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        let partTwoAttributes = [NSForegroundColorAttributeName: UIColor.white,
                                 NSFontAttributeName: UIFont.boldSystemFont(ofSize: 15)]
        
        let partOne = NSMutableAttributedString(string: "Don't have an account? ",
                                                attributes: partOneAttributes)
        let partTwo = NSMutableAttributedString(string: "Sign up",
                                                attributes: partTwoAttributes)
        
        let title = NSMutableAttributedString()
        title.append(partOne)
        title.append(partTwo)
        
        registerButton.setAttributedTitle(title, for: .normal)
    }
}
