//
//  Salon.swift
//  Instalook-User
//
//  Created by jets on 5/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import ObjectMapper

class Salon: Mappable {
    
    var salonID: Int?
    var salonName, salonEmail, salonLocation, salonType: String?
    var images: [Images]?
    var posts: [Post]?
    var points: [Points]?
    var users: [User]?
    var salonRate: Int?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        if map.mappingType == MappingType.fromJSON{
            salonID <- map["salonId"]
            salonName <- map["salonName"]
            salonEmail <- map["salonEmail"]
            salonLocation <- map["salonLocation"]
            salonType <- map["salonType"]
            images <- map["images"]
            posts <- map["posts"]
            points <- map["points"]
            users <- map["users"]
            salonRate <- map["salonRate"]
        }
    }
}
