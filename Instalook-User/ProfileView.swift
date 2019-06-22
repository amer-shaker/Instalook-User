//
//  File.swift
//  Instalook-User
//
//  Created by jets on 6/20/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation

protocol ProfileView {
    func showUserName(name:String)
    func showUserPicture()
    func showUserNumberOfFollowing(followings:Int)
    func showUserNumberOfSavedPosts(posts:Int)
    func refreshProfileData()
    
}
