//
//  Booking.swift
//  Instalook-User
//
//  Created by jets on 6/15/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation

import Foundation
import ObjectMapper

class Booking: Mappable {
    
    var userId: Int?
    var barberId: Int?
    var date: String?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        userId <- map["userId"]
        barberId <- map["barberId"]
        date <- map["date"]
        
    }
}

