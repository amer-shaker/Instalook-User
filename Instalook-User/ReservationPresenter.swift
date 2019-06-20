//
//  ReservationPresenter.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import UIKit
class ReservationPresenter
{
    weak var reservationView: ReservationView!
    var reservationInteractor: ReservationInteractor!
    private var reservations = [Reservation]()
    
    init(reservationView: ReservationView) {
        self.reservationView = reservationView
        self.reservationInteractor = ReservationInteractor()
        getAllUserReservations()
        //reservationView.reloadViewData()
    
     
    }
    public func getAllUserReservations()    {
        reservationView.showIndicator()
        self.reservationInteractor.getAllUserReservations(userId: 272){ [weak self] reservations in
            if reservations != nil {
                self?.reservations = reservations!
                self?.reservationView.reloadViewData()
                
                print("Reservation array for 272 user : \(reservations?.count)")
                
                
                 return true
            } else {
                print("Reservation array  = 0")
                
                 return false
            }
        }
        
        reservationView.hideIndicator()
            }
    public func cancelReservation(index:Int){
        reservations.remove(at: index)
        reservationInteractor.cancelReservation(bookId: index)
        reservationView.reloadViewData()
    }
    public  func configureCell(reservationCell:ReservationCellView , index:Int)
    {
        
        let reservation = self.reservations[index]
        print(" salon name : \(reservation.salonName)")
        reservationCell.showSalonName(salonName: reservation.salonName)
        reservationCell.showDateTime(dateTime: "\(reservation.reservationDate!)")
        reservationCell.showBarberName(name: reservation.barberName)
        
        
        
    }
    public func getReservationsCount()->Int{
        
        return reservations.count
    }
    
}
