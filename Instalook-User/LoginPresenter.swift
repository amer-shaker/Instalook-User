//
//  LoginPresenter.swift
//  Instalook-User
//
//  Created by Amer Shaker on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import UIKit

class LoginPresenter {
    
    private weak var view: LoginView?
    private let userInteractor: UserInteractor
    private var user: User?
    
    init(view: LoginView) {
        self.view = view
        userInteractor = UserInteractor()
    }
    
    func login(email: String, password: String) {
        
        if isValidEmail(email: email),
            isValidPassword(password: password) {
            
            view?.showIndicator()
            userInteractor.login(email: email, password: password) { [unowned self] (user, error) in
                
                self.view?.hideIndicator()
                if let error = error {
                    self.view?.showError(error: error.localizedDescription)
                } else {
                    guard let user = user else {
                        self.view?.showError(error: "Wrong username or password.")
                        return
                    }
                    
                    self.user = user
                    self.view?.loginSuccess(user: self.user!)
                    
                    guard let userId = user.userId else { return }
                    self.saveUserIdIntoUserDefaults(userId: userId)
                }
            }
        } else {
            view?.showError(error: "Invalid Credentials")
        }
    }
    
    private func isValidEmail(email: String) -> Bool {
        return !(email.isEmpty)
    }
    
    private func isValidPassword(password: String) -> Bool {
        return !(password.isEmpty)
    }
    
    private func saveUserIdIntoUserDefaults(userId: Int) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(userId, forKey: "userId")
    }
}
