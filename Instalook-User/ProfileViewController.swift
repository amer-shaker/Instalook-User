//
//  ProfileViewController.swift
//  Instalook
//
//  Created by jets on 5/21/19.
//  Copyright © 2019 jets. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    
    @IBOutlet weak var pointsView: UIView!
    @IBOutlet weak var userImage: UIImageView!
    var pointsController:PointsViewController!
    var postsController:PostsViewController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       userImage =  Util.customizeProfileImage(borderImage: 2.0, cornerRedius: userImage.frame.height/2,imageView: userImage)
        // intial of Two View controller
        pointsController = self.storyboard?.instantiateViewController(withIdentifier: "points") as! PointsViewController;
        postsController = self.storyboard?.instantiateViewController(withIdentifier: "posts") as! PostsViewController;
        
        //********
        
        // add views to segmentView
        pointsView.addSubview(pointsController.view)
        pointsView.addSubview(postsController.view)
        //****

        
        

        
    }
    @IBAction func swichProfileUserViews(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            pointsView.bringSubview(toFront: pointsController.view)
            print("hellookmlkmnlk")
            break
        case 1:
            pointsView.bringSubview(toFront: postsController.view)
            print("hellookmlkmnlk")
        default:
            pointsView.bringSubview(toFront: postsController.view)
            
        }
    }
    
    

 

    
}
