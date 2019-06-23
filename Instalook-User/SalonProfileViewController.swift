//
//  SalonProfileViewController.swift
//  Instalook-User
//
//  Created by jets on 6/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class SalonProfileViewController: UIViewController, SalonProfileView {

    @IBOutlet weak var SalonImage: UIImageView!
   
    @IBOutlet weak var SalonNameLabel: UILabel!
    @IBOutlet weak var SalonAddressLabel: UILabel!
    @IBOutlet weak var viewSwiching: UIView!
    var salonProfilePresenter:SalonProfilePresenter!
    var salonIndex:Int!
    var barberTV: SalonBarbersTableViewController!
    var salonServiceTV: SalonServicesTableViewController!
    var salon:Salon!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        barberTV = self.storyboard?.instantiateViewController(withIdentifier: "barbertableview") as! SalonBarbersTableViewController;
        salonServiceTV = self.storyboard?.instantiateViewController(withIdentifier: "servicetableview") as! SalonServicesTableViewController
        var bookingViewController:BookingViewController =  self.storyboard?.instantiateViewController(withIdentifier: "bookingview") as! BookingViewController
        salonProfilePresenter = SalonProfilePresenter(salonView: self,barberTV: barberTV,salonServiceTV: salonServiceTV,bookingView: bookingViewController, salon: salon!)
        salonProfilePresenter.showSalonData()

      //  barberTV.barbers = salonProfilePresenter.barbers
      //  salonServiceTV.salonServices = salonProfilePresenter.salonServices
        
        
        viewSwiching.addSubview(salonServiceTV.view)
        viewSwiching.addSubview(barberTV.view)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showImage(image:UIImage){
        SalonImage.image = image
    }
    func showSalonName(name:String){
        SalonNameLabel.text = name
    
    }
    func showSalonAddress(address:String){
        SalonAddressLabel.text = address
    }
    func showSalonRate()
    {}
    
    
    @IBAction func swichView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            viewSwiching.bringSubview(toFront: barberTV.view)
            print("barbers view")
            break
        case 1:
            viewSwiching.bringSubview(toFront:salonServiceTV.view)
            print("services view")
        default:
            viewSwiching.bringSubview(toFront: barberTV.view)
            
        }

    }
    func showErrorAlert(error: String){
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
        
    }
    func reloadData(){
      //  self.reloadData()
        self.barberTV.tableView.reloadData()
        self.salonServiceTV.tableView.reloadData()
    }

   
    
    
    @IBAction func makeReservation(_ sender: Any) {
        
        
        salonProfilePresenter.goToBookingView(salonProfileViewController: self)
        
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
