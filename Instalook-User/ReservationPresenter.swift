//
//  ReservationPresenter.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
class ReservationPresenter
{
   weak var reservationView:ReservationView!
    var reservationInteractor:ReservationInteractor!
    var reservations = [Reservation]()
    
    init(reservationView: ReservationView) {
        self.reservationView = reservationView
        self.reservationInteractor = ReservationInteractor()
    }
    
    public func getAllUserReservations()
    {
        reservationView.showIndicator()
        self.reservationInteractor.getAllUserReservations(userId: 222){ [unowned self] reservations in
            if reservations != nil {
                self.reservations = reservations!
           // self.view?.successfullLogin()
                //l,dlpl,
                return true
            } else {
           // self.view?.failedLogin()
                return false
        }
    }
        reservationView.hideIndicator()
  }
  public  func configureCell(reservationCell:ReservationCellView , index:Int)
    {
        let reservation = self.reservations[index]
        reservationCell.showSalonName(salonName: reservation.reservationDate)
        reservationCell.showDateTime(dateTime: reservation.reservationDate)

    
    }
   public func getReservationsCount()->Int{
        return reservations.count
    }

}
