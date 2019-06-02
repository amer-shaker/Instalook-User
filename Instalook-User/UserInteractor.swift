//
//  LoginInteractor.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class UserInteractor {
    
    func login(email: String,
               password: String,
               completionHandler: @escaping (User?, Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.login(email: email, password: password)).responseObject {
            (response: DataResponse<User>) in
            let result = response.result
            switch result {
            case .success(let user):
                completionHandler(user, nil)
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    func register(user: User,
                  completionHandler: @escaping (Error?) -> Void) {
        
        Alamofire.request(InstalookRouter.register(user: user)).responseJSON {
            (response: DataResponse<Any>) in
            let result = response.result
            switch result {
            case .success:
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error)
            }
        }
    }
    
//    func register(user: User, completionHandler: @escaping (_ result: Bool) -> Void) {
//        
//        Alamofire.request(InstalookRouter.register(user: user)).responseJSON { response in
//            
//            if let response = response.data {
//                print("Response Data: \(response)")
//            } else {
//                print("Response Data: nil")
//            }
//            
//            if let request = response.request {
//                print("Request Request: \(request)")
//                print("Request Description: \(request.description)")
//                print("Request Debug Description: \(request.debugDescription)")
//                print("Response Request HTTP method: \(request.httpMethod!)")
//                print("Response Request Content-Type: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
//            } else {
//                print("Response Request: nil")
//            }
//            
//            if let responseStatusCode = response.response {
//                print("Response Status Code: \(responseStatusCode.statusCode)")
//            } else {
//                print("Response Status Code: nil")
//            }
//            
//            if let error = response.error {
//                print("Response Error Code: \(error.localizedDescription)")
//            } else {
//                print("Response Error Code: nil")
//            }
//            
//            
//            guard let data = response.data else {
//                completionHandler(false)
//                return
//            }
//            
//            completionHandler(true)
//        }
//    }

}
