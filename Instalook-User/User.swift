//
//  User.swift
//  Instalook-User
//
//  Created by Amer Shaker on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import ObjectMapper

class User: NSObject, Mappable,NSCoding{
    
    var userId: Int?
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userId, forKey: "userId")
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(password, forKey: "password")
        
    }
    override init()
    {}
    
    required init?(coder  aDecoder: NSCoder){
        userId = aDecoder.decodeObject(forKey: "userId") as! Int
        firstName = aDecoder.decodeObject(forKey: "firstName") as! String
        lastName = aDecoder.decodeObject(forKey: "lastName") as! String
        email = aDecoder.decodeObject(forKey: "email") as! String
        password = aDecoder.decodeObject(forKey: "password") as! String
        
        
    }
    
    required init(map: Map) {
        
    }
    
    func mapping(map: Map) {
        userId <- map[NetworkingConstants.userId]
        firstName <- map[NetworkingConstants.firstName]
        lastName <- map[NetworkingConstants.lastName]
        email <- map[NetworkingConstants.email]
        password <- map[NetworkingConstants.password]
    }
}
