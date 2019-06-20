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
        
    }
    public func getAllUserReservations()
    {
        reservationView.showIndicator()
        self.reservationInteractor.getAllUserReservations(userId: 222){ [unowned self] reservations in
            if reservations != nil {
                self.reservations = reservations!
                print("Reservation array for 222 user : \(reservations?.count)")
                
                return true
            } else {
                print("Reservation array  = 0")
                
                return false
            }
        }
        reservationView.hideIndicator()
    }
    public  func configureCell(reservationCell:ReservationCellView , index:Int)
    {
        
        let reservation = self.reservations[index]
        print(" salon name : \(reservation.salonName)")
        reservationCell.showSalonName(salonName: reservation.salonName)
        reservationCell.showDateTime(dateTime: " date \(reservation.reservationDate)")  
        
    }
    public func getReservationsCount()->Int{
        print("number of reser :\(reservations.count)")
        return reservations.count
    }
    
}
