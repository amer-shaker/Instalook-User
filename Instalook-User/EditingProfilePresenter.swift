//
//  EditingProfilePresenter.swift
//  Instalook-User
//
//  Created by jets on 6/21/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
class EditingProfilePresenter{
    let editingProfileView:EditingProfileView!
    let userInteractor:UserInteractor!
    
    init(editProfileView:EditingProfileView) {
        self.editingProfileView = editProfileView
        userInteractor = UserInteractor()
        
    }
    
    func updateUserProfile(user:User,location:String)
    {
        userInteractor.update(user: user, location: location){ [unowned self] error in
            if let error = error {
                self.editingProfileView.showErrorAlert(error: error.localizedDescription)
                
            } else {
                

            }
        }
    }
    
}
