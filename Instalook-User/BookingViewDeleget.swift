//
//  BookingViewDeleget.swift
//  Instalook-User
//
//  Created by jets on 6/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation

protocol BookingViewDeleget {
    
    func showServiceName(name:String)
    func showBarberName(name:String)
    func showError(error:String)
    func getIndexOfBarber(index:Int)
    func getIndexOfSalonService(index:Int)
}
