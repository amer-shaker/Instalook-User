//
//  BookingViewController.swift
//  Instalook-User
//
//  Created by jets on 6/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController, BookingViewDeleget {
    @IBOutlet weak var datePickerTF: UITextField!

    @IBOutlet weak var barberName: UIButton!
    @IBOutlet weak var serviceName: UIButton!
    @IBOutlet weak var timePickerTF: UITextField!
    var barbers = [Barber]()
    var salonServices = [SalonService]()
    var barber:Barber!
    var salonService:SalonService!
    var user:User!
    let datePicker = UIDatePicker()
    var bookingPresenter:BookingPresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        showDateOrTimePicker(flag: 1,textField: datePickerTF)
        showDateOrTimePicker(flag: 2,textField: timePickerTF)
        let userData = UserDefaults.standard.data(forKey: "user")
        let decodedUser:User =  NSKeyedUnarchiver.unarchiveObject(with: userData!) as! User
        user = decodedUser
        
        
        

        // Do any additional setup after loading the view.
    }
    
    func showDateOrTimePicker(flag:Int,textField:UITextField){
        //Formate Date
        var funcName:Selector!
        bookingPresenter = BookingPresenter(bookingDeleget: self)
        if flag == 1 {
            datePicker.datePickerMode = .date
            funcName = "donedatePicker"
            
            //ToolBar
            let toolbar = UIToolbar();
            toolbar.sizeToFit()
            
            //done button & cancel button
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.bordered, target: self, action: funcName)
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.bordered, target: self, action: funcName)
            toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
            
            // add toolbar to textField
            textField.inputAccessoryView = toolbar
            // add datepicker to textField
            textField.inputView = datePicker
            
        }else if flag == 2{
            datePicker.datePickerMode = .time
            funcName = "doneTimePicker"
            
            //ToolBar
            let toolbar = UIToolbar();
            toolbar.sizeToFit()
            
            //done button & cancel button
            let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.bordered, target: self, action: funcName)
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
            let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.bordered, target: self, action: funcName)
            toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
            
            // add toolbar to textField
            textField.inputAccessoryView = toolbar
            // add datepicker to textField
            textField.inputView = datePicker

        }
        
        
        
        
    }
    
    func donedatePicker(){
        //For date formate
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        datePickerTF.text = formatter.string(from: datePicker.date)
        //dismiss date picker dialog
        self.view.endEditing(true)
    }
    func doneTimePicker(){
        //For date formate
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        timePickerTF.text = formatter.string(from: datePicker.date)
        //dismiss date picker dialog
        self.view.endEditing(true)
    }
    
    func cancelDatePicker(){
        //cancel button dismiss datepicker dialog
        self.view.endEditing(true)
    
}

    @IBAction func chooseBarber(_ sender: Any) {
        var salonBarberView:SalonBarbersTableViewController =  self.storyboard?.instantiateViewController(withIdentifier: "barbertableview") as! SalonBarbersTableViewController
        salonBarberView.flage = 2
        salonBarberView.bookingviewDeleget = self
        salonBarberView.barbers = self.barbers
        self.navigationController?.pushViewController(salonBarberView, animated: true)
    }
    @IBAction func chooseService(_ sender: Any) {
         var salonServicesView:SalonServicesTableViewController =  self.storyboard?.instantiateViewController(withIdentifier: "servicetableview") as! SalonServicesTableViewController
        salonServicesView.bookingviewDeleget = self
        salonServicesView.flage = 2
        salonServicesView.salonServices = self.salonServices
        self.navigationController?.pushViewController(salonServicesView, animated: true)

    }

    @IBAction func makeReservation(_ sender: Any) {
        
        showConfirmationAlert()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showServiceName(name:String){
        self.serviceName.setTitle(name, for: .normal)
        
    }
    func showBarberName(name:String){
         self.barberName.setTitle(name, for: .normal)
    }
    func showError(error:String){
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)

    }
    
    func getIndexOfBarber(index:Int){
        barber = barbers[index]
    }
    func getIndexOfSalonService(index:Int){
        salonService = salonServices[index]
    }
    
    func showConfirmationAlert(){
        let alertController = UIAlertController(title: "Confirmation", message: "save changes !", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "CANCEL", style: .default, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            if self.user.userId! != nil &&  self.barber.barberId! != nil && !self.datePickerTF.text!.isEmpty && !self.timePickerTF.text!.isEmpty  {
                print("user id :\(self.user.userId!)")
                print("barber id :\(self.barber.barberId!)")
                print("date :\(self.datePickerTF.text! + "T" + self.timePickerTF.text!)")


                self.bookingPresenter.book(userId: self.user.userId!, barberId: self.barber.barberId!, date: self.datePickerTF.text! + "T" + self.timePickerTF.text!)
                self.updateViewController()
                self.navigationController?.popViewController(animated: true)
            }else{
                self.showError(error: "validation error")
            }
           
                
            })

        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)

        
        
        
    }
    func updateViewController(){
        self.datePickerTF.text = ""
        self.timePickerTF.text = ""
        self.barberName.setTitle("+ Choose Barber ", for: .normal)
        self.serviceName.setTitle("+ Choose Service ", for: .normal)

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
