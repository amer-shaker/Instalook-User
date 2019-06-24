//
//  SearchSalonsPresenter.swift
//  Instalook-User
//
//  Created by jets on 5/24/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import UIKit

class SearchPreseneter {
    
    // MARK: - properties
    private weak var view: SearchView?
    private let interactor = SearchInteractor()
    private var salons = [Salon]()
    private var rate: Int?
    
    init(view: SearchView) {
        self.view = view
    }
    
    // MARK: - requestes
    func getSalons(){
        view?.showIndicator()
        interactor.getSalons(){ [unowned self] (salons, error )in
            if salons != nil{
                self.view?.fetchingDataSuccess()
                self.salons = salons!
                self.view?.reloadData()
                self.view?.hideIndicator()
            }else {
                self.view?.showError(error: error)
                self.view?.hideIndicator()
            }
        }
    }
    
    func getRate(salonId: Int){
        interactor.getRate(salonId: salonId, completionHandler: { (rate, error) in
            if rate != nil{
                self.rate = rate
                print("presenter rateeee \(rate)")
                self.view?.reloadData()
            }else {
                self.view?.showError(error: error)
            }
        })
    }
    
    func getClickedSalon(index: Int){
         let salon = salons[index]
         view?.getClickedSalon(salon: salon)
    }
    
    // go to salon profile
//    func goToSalonProfile(searchView: SearchSalonsTableViewController, salonProfile: SalonProfileViewController, salonIndex:Int){
//        
//        /*salonProfile.salon = salons[salonIndex]
//
//        if let index = salons.index(of: barber) {
//        }*/
//        
//        print(salonProfile.salon.salonID!)
//        //searchView.present(salonProfile, animated: true, completion: nil)
//        searchView.navigationController?.pushViewController(salonProfile, animated: true)
//    }
    
  
    
    
    // MARK: - cell configuration
    func configureCell(cell: SalonTableViewCell, index: Int){
        let salon = salons[index]
        cell.displayName(name: salon.salonName!)
        cell.displayAddress(address: salon.salonLocation!)
        //cell.displayRate(rate: rate)
    }
    
    func getSalonsCount() -> Int {
        return salons.count
    }
    
    //MARK: - filter functions
    func filterByName(text: String){
        salons = salons.filter { (salon) -> Bool in
            return (salon.salonName!.lowercased().contains(text.lowercased()))
        }
        self.view?.reloadData()
    }
    
    func filterByLocation(text: String){
        salons = salons.filter { (salon) -> Bool in
            return (salon.salonLocation!.lowercased().contains(text.lowercased()))
        }
        self.view?.reloadData()
    }
    

}
