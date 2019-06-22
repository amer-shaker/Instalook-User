//
//  ProfilePresenter.swift
//  Instalook-User
//
//  Created by jets on 6/22/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
class ProfilePresenter {
    var profileView:ProfileView!
    
    
    init(profileView:ProfileView)
    {
    self.profileView = profileView
    }
    func refreshData()
    {
        profileView.refreshProfileData()
    }
    
}
