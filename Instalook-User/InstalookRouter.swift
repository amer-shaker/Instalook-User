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
    case salonRate(salonId: Int)
    case allUserReservation(userId:Int)
    case cancelReservation(reservationId:Int)
    case book(booking:Booking)
    case updateUserProfile(user:User,location:String)
    case getBarbers(salonId:Int)
    case getSalonServices(salonId:Int)
    
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
            return NetworkingConstants.bookingRequestMapping + "/" + NetworkingConstants.book
        case .salonRate:
            return NetworkingConstants.salonRequestMapping + "/" + NetworkingConstants.getSalonRate
        case .updateUserProfile:
            return NetworkingConstants.userRequestMapping + "/" + NetworkingConstants.update
        case .getBarbers:
            return NetworkingConstants.barberRequestMapping + "/" + NetworkingConstants.getBarbers
        case .getSalonServices:
            return NetworkingConstants.salonServiceRequestMapping + "/" + NetworkingConstants.getSalonServices
        }
    }
    
    var httpMethod: HTTPMethod {
        
        switch self {
        case .login, .register, .book:
            return .post
        case .search, .allUserReservation, .cancelReservation, .salonRate, .getBarbers,
             .getSalonServices:
            return .get
        case .updateUserProfile:
            return .patch
        }
    }
    
    var httpHeaders: HTTPHeaders {
        
        var httpHeaders = [String:String]()
        
        switch self {
        case .register,.updateUserProfile,.book:
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
        case let .updateUserProfile(user,location):
            body[NetworkingConstants.userId] = user.userId!
            body[NetworkingConstants.firstName] = user.firstName!
            body[NetworkingConstants.lastName] = user.lastName!
            body[NetworkingConstants.email] = user.email!
            body[NetworkingConstants.password] = user.password!
            body[NetworkingConstants.location] = location
        case let .book(booking):
            body["userId"] = booking.userId
            body["barberId"] = booking.barberId
            body["date"] = booking.date
            
            //print("Request Body:\nuser id : \(userId)\nbarber id : \(barberId)\n booking date: \(date)")
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
        case let .salonRate(salonId):
            params[NetworkingConstants.salonId] = salonId
        case let .getBarbers(salonId):
            params["salonId"] = salonId
        case let .getSalonServices(salonId):
            params["salonId"] = salonId
            
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
        case .login, .search,.allUserReservation, .cancelReservation, .book, .salonRate, .getBarbers, .getSalonServices:
            return try URLEncoding.methodDependent.encode(urlRequest, with: params)
        case .register,.updateUserProfile,.book:
            return try JSONEncoding.default.encode(urlRequest, with: body)
        }
    }
}

