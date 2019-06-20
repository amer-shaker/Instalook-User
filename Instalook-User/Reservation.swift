//
//  Reservation.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import ObjectMapper
class Reservation : Mappable {
    var reservationDate:Double!
    var salonName:String!
    var reservationId:Int!
    var barberName:String!
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        reservationDate <- map["time"]
        salonName <- map["salonName"]
        reservationId <- map["bookingId"]
        barberName <- map["barberName"]
        
    }
}
