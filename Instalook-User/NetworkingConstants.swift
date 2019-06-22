//
//  NetworkingConstants.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation

struct NetworkingConstants {
    
    static let baseURL = "https://instalook-api.herokuapp.com"
    
    // Request Headers
    static let contentType = "Content-Type"
    static let accept = "Accept"
    static let contentTypeJSON = "application/json"
    
    // Request Mappings
    static let userRequestMapping = "user"
    static let salonRequestMapping = "salon"
    
    
    // User Requests
    static let login = "login"
    static let register = "register"
    static let update = "update"
    
    // User Query Parameters
    static let userId = "userId"
    static let firstName = "firstName"
    static let lastName = "lastName"
    static let email = "email"
    static let password = "password"

    static let salonId = "salonId"
    static let location = "location"
    
    // Salon Requests
    static let getSalons = "getSalons"
    static let getSalonsById = "getSalonsById"
    static let getSalonRate = "getSalonRate"

    // Booking Request
    static let getUserBookings = "getBookings"
    static let book = "book"
    static let cancelBooking = "cancelBooking"
}
