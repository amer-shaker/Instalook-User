//
//  ReservationView.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation

protocol ReservationView: class {
    func showAlert()
    func showIndicator()
    func hideIndicator()
    func reloadViewData()
}

protocol ReservationCellView: class {
    func showSalonName(salonName:String)
    func showDateTime(dateTime:String)
    func showBarberName(name:String)
}


