//
//  LoginView.swift
//  Instalook-User
//
//  Created by Amer Shaker on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation

protocol LoginView: class {
    func showIndicator()
    func hideIndicator()
    func loginSuccess()
    func showError(error: String)
}
