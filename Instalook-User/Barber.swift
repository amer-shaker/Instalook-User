//
//  Barber.swift
//  Instalook-User
//
//  Created by jets on 6/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import ObjectMapper


class Barber : NSObject, Mappable {
    var barberId:Int?
    var firstName:String?
    var lastName:String?
    var role:String?
    var rate:Int?
    var barberPicture:String?
    var isAvailable:Int?
    
    var salonId:Int?
    override init(){}
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        barberId <- map["barberId"]
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        role <- map["role"]
        rate <- map["rate"]
        barberPicture <- map["barberPicture"]
        isAvailable <- map["isAvailable"]

        
    }
    
}
