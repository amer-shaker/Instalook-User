//
//  ProfileViewController.swift
//  Instalook
//
//  Created by jets on 5/21/19.
//  Copyright © 2019 jets. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController,ProfileView {
    
    var user:User!

    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var numberOfSavedPostLabel: UILabel!
    @IBOutlet weak var numberOfFollowingsLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    var profilePresenter:ProfilePresenter!
    var reservatinTV:ReservationsTVController!
    var pointTV: PointsTVController!
    var followTV: FollowedSalonsTV!
    var savedPostTV:SavedPostsTVController!
    
    @IBAction func goToEditingProfile(_ sender: Any) {
        let storyboard = UIStoryboard(name: "UserProfileScenario", bundle: Bundle.main)
        let editingProfileView = storyboard.instantiateViewController(withIdentifier: "EditingProfileController") as! EditingProfileViewController
        self.present(editingProfileView, animated: true, completion: nil)
        editingProfileView.profileView = self
        
        
    }
    
       override func viewDidLoad() {
        super.viewDidLoad()
        profilePresenter = ProfilePresenter(profileView: self)
        let userData = UserDefaults.standard.data(forKey: "user")
        let decodedUser:User =  NSKeyedUnarchiver.unarchiveObject(with: userData!) as! User
        user = decodedUser
        usernameLabel.text = user.firstName!.appending(" ").appending(user.lastName!)
        emailLabel.text = user.email!
        print("user name : ")
        
        
        
        
        print("search view search view search view search view")
        
       userImage =  Utils.customizeProfileImage(borderImage: 2.0, cornerRedius: userImage.frame.height/2,imageView: userImage) as! UIImageView
        // intial of Two View controller
        reservatinTV = self.storyboard?.instantiateViewController(withIdentifier: "ReservationTVC") as! ReservationsTVController;
    pointTV = self.storyboard?.instantiateViewController(withIdentifier: "PointsTVController") as! PointsTVController
        followTV = self.storyboard?.instantiateViewController(withIdentifier: "FollowingTVController") as! FollowedSalonsTV
        savedPostTV = self.storyboard?.instantiateViewController(withIdentifier: "SavedPostTVController") as! SavedPostsTVController
        
        
                //********
        
        // add views to segmentView
        profileView.addSubview(savedPostTV.view)
        profileView.addSubview(pointTV.view)
        profileView.addSubview(followTV.view)
        
        profileView.addSubview(reservatinTV.view)
        
       
        //****
        
        
        

        
    }
    @IBAction func swichProfileUserViews(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            profileView.bringSubview(toFront: reservatinTV.view)
            print("reservation view")
            break
        case 1:
           profileView.bringSubview(toFront:followTV.view)
            print("foolowing view")
        case 2:
            profileView.bringSubview(toFront:pointTV.view)
            print("points view")
        case 3:
           profileView.bringSubview(toFront: savedPostTV.view)
            print("saved post view")
        default:
            profileView.bringSubview(toFront: reservatinTV.view)
            
        }
    }
    
    
    
    
    func showUserName(name:String)
    {
        self.usernameLabel.text = name
    }
    func showUserPicture(){}
    func showUserNumberOfFollowing(followings:Int){
        self.numberOfFollowingsLabel.text = "\(followings)"
    }
    func showUserNumberOfSavedPosts(posts:Int){
        self.numberOfSavedPostLabel.text = "\(posts)"

    }
    
    func refreshProfileData(){
        let userData = UserDefaults.standard.data(forKey: "user")
        let decodedUser:User =  NSKeyedUnarchiver.unarchiveObject(with: userData!) as! User
        user = decodedUser
        usernameLabel.text = user.firstName!.appending(" ").appending(user.lastName!)
        emailLabel.text = user.email!
        print("user name : ")
    }

 

    
}
