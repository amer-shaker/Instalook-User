//
//  LoginPresenter.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation

class LoginPresenter {
    
    private weak var view: LoginView?
    private var loginInteractor: LoginInteractor
    
    init(view: LoginView) {
        self.view = view
        loginInteractor = LoginInteractor()
    }
    
    func login(email: String, password: String) {
        loginInteractor.login(email: email, password: password) { [unowned self] user in
            if user != nil {
                self.view?.successfullLogin()
            } else {
                self.view?.failedLogin()
            }
        }
    }
    
    func validateFields(email: String, password: String) -> Bool {
        
        if email.isEmpty || password.isEmpty {
            view?.showAlert()
            return false
        }
        
        return true
    }
}
