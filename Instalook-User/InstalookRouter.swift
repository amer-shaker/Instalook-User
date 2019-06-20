//
//  InstalookRouter.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import Alamofire

enum InstalookRouter: URLRequestConvertible {
    
    case login(email: String, password: String)
    case register(user: User)
    case search()
    case allUserReservation(userId:Int)
    case cancelReservation(reservationId:Int)
    case book(booking:Booking)
    
    var path: String {
        
        switch self {
        case .login:
            return NetworkingConstants.userRequestMapping + "/" + NetworkingConstants.login
        case .register:
            return NetworkingConstants.userRequestMapping + "/" + NetworkingConstants.register
        case .search:
            return NetworkingConstants.salonRequestMapping + "/" + NetworkingConstants.getSalons
        case .allUserReservation:
            return NetworkingConstants.userRequestMapping + "/" + NetworkingConstants.getUserBookings
        case .cancelReservation:
            return NetworkingConstants.cancelBooking
        case .book:
            return NetworkingConstants.book
        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        case .login, .register, .book:
            return .post
        case .search, .allUserReservation, .cancelReservation:
            return .get
        }
    }
    
    var httpHeaders: HTTPHeaders {
        
        var httpHeaders = [String:String]()
        
        switch self {
        case .register:
            httpHeaders[NetworkingConstants.accept] = NetworkingConstants.contentTypeJSON
            httpHeaders[NetworkingConstants.contentType] = NetworkingConstants.contentTypeJSON
        default:
            print("Empty request headers")
        }
        
        return httpHeaders
    }
    
    var body: [String: Any] {
        
        var body = [String:Any]()
        
        switch self {
        case let .register(user):
            body[NetworkingConstants.firstName] = user.firstName!
            body[NetworkingConstants.lastName] = user.lastName!
            body[NetworkingConstants.email] = user.email!
            body[NetworkingConstants.password] = user.password!
        case let .book(Booking):
            body["userId"] = Booking.userId!
            body["barberId"] = Booking.barberId!
            body["date"] = Booking.date!
            
            print("Request Body:\nuser id : \(Booking.userId!)\nbarber id : \(Booking.barberId!)\n booking date: \(Booking.date!)")
        default:
            print("Empty request body")
        }
        
        return body
    }
    
    var params: [String: Any] {
        
        var params = [String:Any]()
        
        switch self {
        case let .login(email, password):
            params[NetworkingConstants.email] = email
            params[NetworkingConstants.password] = password
        case let .allUserReservation(userId):
            params["userId"] = userId
        case let .cancelReservation(reservationId):
            params["bookingId"] = reservationId
        default:
            print("Empty request params")
        }
        
        return params
    }
    
    func asURLRequest() throws -> URLRequest {
        let baseURL = try NetworkingConstants.baseURL.asURL()
        
        // URL Request Components
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.allHTTPHeaderFields = httpHeaders
        
        switch self {
        case .login, .search,.allUserReservation, .cancelReservation, .book:
            return try URLEncoding.methodDependent.encode(urlRequest, with: params)
        case .register:
            return try JSONEncoding.default.encode(urlRequest, with: body)
        }
    }
}

