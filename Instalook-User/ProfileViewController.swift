//
//  ProfileViewController.swift
//  Instalook
//
//  Created by jets on 5/21/19.
//  Copyright © 2019 jets. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    var reservatinTV:ReservationsTVController!
    var pointTV: PointsTVController!
    var followTV: FollowedSalonsTV!
    var savedPostTV:SavedPostsTVController!
       override func viewDidLoad() {
        super.viewDidLoad()
        
       userImage =  Util.customizeProfileImage(borderImage: 2.0, cornerRedius: userImage.frame.height/2,imageView: userImage) as! UIImageView
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
            print("hellookmlkmnlk")
            break
        case 1:
           profileView.bringSubview(toFront:followTV.view)
            print("hellookmlkmnlk")
        case 2:
            profileView.bringSubview(toFront:pointTV.view)
            print("hellookmlkmnlk")
        case 3:
           profileView.bringSubview(toFront: savedPostTV.view)
            print("hellookmlkmnlk")
        default:
            profileView.bringSubview(toFront: reservatinTV.view)
            
        }
    }
    
    

 

    
}
