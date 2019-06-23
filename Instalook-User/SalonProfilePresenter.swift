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
    //will assign by delegation
    var salon:Salon!
    // will assign by web service
    var barbers:[Barber]!
    var salonServices:[SalonService]!
    init(salonView:SalonProfileView,barberTV:SalonBarbersTableViewController,salonServiceTV:SalonServicesTableViewController,salon:Salon)
    {
        self.salonProfileVew = salonView
        self.salon = salon
        self.barberTV = barberTV
        self.salonServiceTV = salonServiceTV
        searchInteractor = SearchInteractor()
        getBarbers()
        getSalonServices()
    }
    
   func showSalonData(){
    salonProfileVew.showSalonName(name: salon.salonName!)
    salonProfileVew.showSalonAddress(address: salon.salonLocation!)
    }
    func getBarbers(){
       // self.barberTV.startAnimating()
        searchInteractor.getSalonBarbers(salonId:202){[weak self]
            (barbers,error) in
            if barbers != nil
            {
                self?.barberTV.barbers = barbers!
                self?.salonProfileVew.reloadData()
               // self?.barberTV.stopAnimating()
                
            }
            else{
                print("get barbers error inside presenter\(error)")
                self?.salonProfileVew.showErrorAlert(error: error!)
            }
        
        }
       

    }
    func getSalonServices(){
      //  self.salonServiceTV.startAnimating()
        searchInteractor.getSalonServices(salonId:202){[weak self]
            (salonServices,error) in
            if salonServices != nil
            {
                self?.salonServiceTV.salonServices = salonServices!
                self?.salonProfileVew.reloadData()
               // self?.salonServiceTV.stopAnimating()
            }
            else{
                print("get SalonServices error inside presenter\(error)")
                self?.salonProfileVew.showErrorAlert(error: error!)

            }
            
        }
        
    }
    
}
