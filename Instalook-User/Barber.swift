//
//  Barber.swift
//  Instalook-User
//
//  Created by jets on 6/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import ObjectMapper

class Barber: NSObject, Mappable {
    
    var barberId: Int?
    var firstName: String?
    var lastName: String?
    var role: String?
    var rate: Double?
    var isAvailable: Int?
    
    override init() {
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        barberId <- map[NetworkingConstants.barberId]
        firstName <- map[NetworkingConstants.barberFirstName]
        lastName <- map[NetworkingConstants.barberLastName]
        role <- map[NetworkingConstants.barberRole]
        rate <- map[NetworkingConstants.barberRate]
        isAvailable <- map[NetworkingConstants.isAvailable]
    }
}
