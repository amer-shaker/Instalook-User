//
//  User.swift
//  Instalook-User
//
//  Created by Amer Shaker on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import ObjectMapper

class User: NSObject, NSCoding, Mappable {
    
    var userId: Int?
    var firstName: String?
    var lastName: String?
    var email: String?
    var password: String?
    
    override init() {
        
    }
    
    init(userId: Int?, firstName: String?, lastName: String?, email: String?, password: String?) {
        self.userId = userId
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }

    required convenience init(coder aDecoder: NSCoder) {
        let userId = aDecoder.decodeInteger(forKey: "userId")
        let firstName = aDecoder.decodeObject(forKey: "firstName") as! String?
        let lastName = aDecoder.decodeObject(forKey: "lastName") as! String?
        let email = aDecoder.decodeObject(forKey: "email") as! String?
        let password = aDecoder.decodeObject(forKey: "password") as! String?
        
        self.init(userId: userId, firstName: firstName, lastName: lastName, email: email, password: password)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(userId, forKey: "userId")
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(lastName, forKey: "lastName")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(password, forKey: "password")
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
