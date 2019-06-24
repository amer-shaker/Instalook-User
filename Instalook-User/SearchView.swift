//
//  SearchSalonsView.swift
//  Instalook-User
//
//  Created by jets on 5/24/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation

protocol SearchView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String?)
    func reloadData()
    func getClickedSalon(salon: Salon)
}
