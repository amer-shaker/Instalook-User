//
//  SearchPreseneter.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import UIKit

class SearchPreseneter {
    
    private weak var view: SearchView?
    private let interactor = SearchInteractor()
    private var salons = [Salon]()
    
    
    init(view: SearchView) {
        self.view = view
    }
    
    func SearchForSalon(type: String, by name: String) {
        
        view?.showIndicator()
        
    }
    
    
    func someFunc(completionHandler: (_ result: String) -> Bool) {
    }
}
