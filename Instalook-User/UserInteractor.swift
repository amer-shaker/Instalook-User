//
//  LoginInteractor.swift
//  Instalook-User
//
//  Created by Amer Shaker on 5/31/19.
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
    func update(user: User,location:String,
                completionHandler: @escaping (Error?) -> Void)
    {
        Alamofire.request(InstalookRouter.updateUserProfile(user: user, location: location)).responseJSON { (response:DataResponse<Any>) in
            
            if let response = response.data {
                print("Response Data User: \(response)")
            } else {
                print("Response Data User : nil")
            }
            
            if let request = response.request {
                print("Response Request User: \(request)")
                print("Response Request HTTP method User: \(request.httpMethod!)")
                
                if let header = request.value(forHTTPHeaderField: NetworkingConstants.contentType) {
                    print("Response Request HTTP USer method: \(header)")
                }
            } else {
                print("Response Request USer: nil")
            }
            
            if let responseStatusCode = response.response {
                print("Response Status Code User: \(responseStatusCode.statusCode)")
            } else {
                print("Response Status Code: nil")
            }
            
            if let error = response.error {
                print("Response Error Code reservation: \(error.localizedDescription)")
            } else {
                print("Response Error Code reservation: nil")
            }
            
            let result = response.result
            switch result {
            case .success:
                completionHandler(nil)
            case .failure(let error):
                completionHandler(error)
            }
        
        }
        
    }
}
