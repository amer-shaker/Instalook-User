//
//  RegistrationPresenter.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation

class RegistrationPresenter {
    
    private weak var view: RegistrationView?
    private var user: User
    private var userInteractor: UserInteractor
    
    init(view: RegistrationView) {
        self.view = view
        user = User()
        userInteractor = UserInteractor()
    }
    
    func register(firstName: String,
                  lastName: String,
                  email: String,
                  password: String,
                  confirmPassword: String) {
        
        let user = User()
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.password = password
        
        userInteractor.register(user: user, completionHandler: { error in
            if error != nil {
                self.view?.failed()
            } else {
                self.view?.success()
            }
        })
    }
}

extension RegistrationPresenter {
    
    // MARK: Validation methods
    private func isValidEmailAddress(email: String) -> Bool {
        return true
    }
    
    private func isValidPassword(password: String) -> Bool {
        return true
    }
    
    private func isValidConfrimPassword(password: String, confirmPassword: String) -> Bool {
        return true
    }
}
