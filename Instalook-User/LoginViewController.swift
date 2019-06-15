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
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    private var presenter: LoginPresenter!

    
    // MARK: View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = LoginPresenter(view: self)
        
        let partOneAttributes = [NSForegroundColorAttributeName: UIColor.black, NSFontAttributeName: UIFont.systemFont(ofSize: 15)]
        let partTwoAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont.systemFont(ofSize: 25)]
        
        let partOne = NSMutableAttributedString(string: "Don't have an account? ", attributes: partOneAttributes)
        let partTwo = NSMutableAttributedString(string: "Sign up", attributes: partTwoAttributes)
        
        let combination = NSMutableAttributedString()
        
        combination.append(partOne)
        combination.append(partTwo)
        
      //  createAccountButton.setAttributedTitle(partOne, for: .normal)
    }
    
    func successfullLogin() {
        print("login success")
    }
    
    func failedLogin() {
        print("login failed")
    }
    
    // MARK: Actions
    @IBAction func login(_ sender: UIButton) {
        let isSuccess = presenter.validateFields(email: emailTextField.text!,
                                 password: passwordTextField.text!)
        
        if isSuccess {
            presenter.login(email: emailTextField.text!, password: passwordTextField.text!)
            
            
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            self.present(homeViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func register(_ sender: UIButton) {
        let registationViewController = self.storyboard?.instantiateViewController(withIdentifier: "RegistationViewController") as! RegistationViewController
        self.present(registationViewController, animated: true, completion: nil)
    }
    
    func showAlert() {
        let alert = UIAlertController.init(title: "Missing Fileds",
                                           message: "Validation",
                                           preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        
        alert.addAction(okAction)
        self.present(alert,
                     animated: true,
                     completion: nil)
    }
}

extension UITextField {
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: newValue!])
        }
    }
}
