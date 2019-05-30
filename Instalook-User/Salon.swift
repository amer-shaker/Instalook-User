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
    
    var id: Int?
    var name: String?
    var location: String?
    var type: String?
    var email: String?
    var rate: Int?
    
    init() {
        
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        /*userId <- map["userId"]
         firstName <- map["firstName"]
         lastName <- map["lastName"]
         email <- map["email"]
         password <- map["password"]*/
    }
}
