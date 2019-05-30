//
//  RegistrationInteractor.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import Alamofire

class RegistrationInteractor {
    
    func register(user: User, completionHandler: @escaping (_ result: Bool) -> Void) {
        
        Alamofire.request(InstalookRouter.register(user: user)).responseJSON { response in
            
            if let response = response.data {
                print("Response Data: \(response)")
            } else {
                print("Response Data: nil")
            }
            
            if let request = response.request {
                print("Response Request: \(request)")
                print("Response Request HTTP method: \(request.httpMethod!)")
                print("Response Request HTTP method: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
            } else {
                print("Response Request: nil")
            }
            
            if let responseStatusCode = response.response {
                print("Response Status Code: \(responseStatusCode.statusCode)")
            } else {
                print("Response Status Code: nil")
            }
            
            if let error = response.error {
                print("Response Error Code: \(error.localizedDescription)")
            } else {
                print("Response Error Code: nil")
            }
            
            
            guard let data = response.data else {
                completionHandler(false)
                return
            }
            
            completionHandler(true)
        }
    }
    
    
    //        Alamofire.request(InstalookRouter.register(user: user)).responseJSON { response in
    //
    //            if let response = response.data {
    //                print("Response Data: \(response)")
    //            } else {
    //                print("Response Data: nil")
    //            }
    //
    //            if let request = response.request {
    //                print("Response Request: \(request)")
    //                print("Response Request HTTP method: \(request.httpMethod!)")
    //                print("Response Request HTTP method: \(request.value(forHTTPHeaderField: NetworkingConstants.contentType)!)")
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
    //              completionHandler(false)
    //                return
    //            }
    //
    //            completionHandler(true)
    //        }
    //    }
}
