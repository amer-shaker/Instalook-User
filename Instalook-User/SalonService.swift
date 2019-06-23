//
//  SalonService.swift
//  Instalook-User
//
//  Created by jets on 6/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import ObjectMapper

class SalonService : NSObject, Mappable {
    var serviceId:Int?
    var serviceName:String?
    var serviceType:String?
    var servicePrice:Double?
    override init(){}
    required init(map: Map) {
        
    }

    func mapping(map: Map) {
        serviceId <- map["serviceId"]
        serviceName <- map["serviceName"]
        serviceType <- map["serviceType"]
        servicePrice <- map["servicePrice"]
    
    }
    
}
