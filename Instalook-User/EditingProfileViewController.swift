//
//  EditingProfileViewController.swift
//  Instalook-User
//
//  Created by jets on 5/26/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class EditingProfileViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate,EditingProfileView{
    var user:User!

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var userLocation: UITextField!
    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var userPhoto: UIImageView!
    var editProfilePresenter:EditingProfilePresenter!
    var profileView:ProfileView!
    var imagePicker = UIImagePickerController()
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        editProfilePresenter = EditingProfilePresenter(editProfileView: self)
        let userData = UserDefaults.standard.data(forKey: "user")
        let decodedUser:User =  NSKeyedUnarchiver.unarchiveObject(with: userData!) as! User
        user = decodedUser
        Utils.customizeProfileImage(borderImage: 2, cornerRedius: userPhoto.frame.height/2, imageView: userPhoto)
        //*********
        firstName.text = user.firstName!
        lastName.text = user.lastName!
        userEmail.text = user.email!
        
        
        
        //***********
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
   
    @IBAction func changeProfilePicture(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        userPhoto.image = image
        print("image imkmkmkmp")
    }
    

   
    @IBAction func saveUserChanges(_ sender: Any) {
        showConfirmationAlert()
        
    }
    @IBAction func discardUserChanges(_ sender: Any) {
        self.dismiss(animated: true)
        
    }
    func showConfirmationAlert(){
        let alertController = UIAlertController(title: "Confirmation", message: "save changes !", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "CANCEL", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            let user = User()
            user.firstName = self.firstName.text!
            user.lastName = self.lastName.text!
            user.email = self.userEmail.text!
            user.password = self.user.password!
            user.userId = self.user.userId!
            self.editProfilePresenter.updateUserProfile(user: user, location: self.userLocation.text!)
            self.dismiss(animated: true, completion: {
                let encodeData:Data = NSKeyedArchiver.archivedData(withRootObject: user)
                UserDefaults.standard.set(encodeData, forKey:"user")
                self.profileView.refreshProfileData()
                
            })
            
        })
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
        
    }
    func showErrorAlert(error: String){
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
