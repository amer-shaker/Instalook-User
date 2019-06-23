//
//  BookingPresenter.swift
//  Instalook-User
//
//  Created by jets on 6/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
class BookingPresenter {
    var bookingDeleget:BookingViewDeleget!
    var searchInteractor:SearchInteractor = SearchInteractor()
    init(bookingDeleget:BookingViewDeleget){
        
       self.bookingDeleget = bookingDeleget
    }
    func book(userId:Int,barberId:Int,date:String)
    {
        searchInteractor.makeReservation(userId: userId, barberId: barberId, date: date){[weak self]
            error in
            if error != nil
            {
                self?.bookingDeleget.showError(error: error.debugDescription)
            }
        }
    }
    
}
