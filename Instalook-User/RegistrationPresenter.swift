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
    private var registrationInteractor: RegistrationInteractor
    private var validation: Validation
    
    init(view: RegistrationView) {
        self.view = view
        user = User()
        registrationInteractor = RegistrationInteractor()
        validation = Validation()
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
        
        registrationInteractor.register(user: user, completionHandler: { result in
            if result {
                self.view?.success()
            } else {
                self.view?.failed()
            }
        })
    }
}

class Validation {
    
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
