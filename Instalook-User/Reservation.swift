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
    var reservationId:Int!
    var reservationDate:String!
    var userId:Int!
    var barberId:Int!
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        reservationId <- map["booking_id"]
        barberId <- map["barber_id"]
        userId <- map["user_id"]
        reservationDate <- map["booking_date_time"]
    }
}
