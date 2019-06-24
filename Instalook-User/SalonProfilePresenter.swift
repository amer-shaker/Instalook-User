//
//  SalonProfilePresenter.swift
//  Instalook-User
//
//  Created by jets on 6/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
class SalonProfilePresenter {
    
    var salonProfileVew:SalonProfileView!
    var searchInteractor:SearchInteractor!
    var barberTV:SalonBarbersTableViewController!
    var salonServiceTV:SalonServicesTableViewController!
    var bookingView:BookingViewController!
    //will assign by delegation
    var salon:Salon!
    // will assign by web service
    var barbers:[Barber]!
    var salonServices:[SalonService]!
    
    init(salonView: SalonProfileView, barberTV: SalonBarbersTableViewController, salonServiceTV: SalonServicesTableViewController,bookingView:BookingViewController, salon: Salon)
    {
        self.salonProfileVew = salonView
        self.salon = salon
        self.barberTV = barberTV
        self.salonServiceTV = salonServiceTV
        self.bookingView = bookingView
        searchInteractor = SearchInteractor()
        getBarbers(salonId: salon.salonID!)
        getSalonServices(salonId: salon.salonID!)
    }
    
   func showSalonData(){
    salonProfileVew.showSalonName(name: salon.salonName!)
    salonProfileVew.showSalonAddress(address: salon.salonLocation!)
    }
    
    func getBarbers(salonId: Int){
       // self.barberTV.startAnimating()
        searchInteractor.getSalonBarbers(salonId: salonId){[weak self]
            (barbers,error) in
            if barbers != nil
            {
                self?.barberTV.barbers = barbers!
                self?.salonProfileVew.reloadData()
                self?.bookingView.barbers = barbers!
               // self?.barberTV.stopAnimating()
                
            }
            else{
                print("get barbers error inside presenter\(error)")
                self?.salonProfileVew.showErrorAlert(error: error!)
            }
        
        }
       

    }
    func getSalonServices(salonId: Int){
      //  self.salonServiceTV.startAnimating()
        searchInteractor.getSalonServices(salonId: salonId){[weak self]
            (salonServices,error) in
            if salonServices != nil
            {
                self?.salonServiceTV.salonServices = salonServices!
                self?.salonProfileVew.reloadData()
                self?.bookingView.salonServices = salonServices!

               // self?.salonServiceTV.stopAnimating()
            }
            else{
                print("get SalonServices error inside presenter\(error)")
                self?.salonProfileVew.showErrorAlert(error: error!)

            }
            
        }
        
    }
    func goToBookingView(salonProfileViewController:SalonProfileViewController)
    {
        
        salonProfileViewController.navigationController?.pushViewController(bookingView, animated: true)
    }
    
}
