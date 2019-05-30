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

class LoginInteractor {
    
    func login(email: String,
               password: String,
               completionHandler: @escaping (_ user: User?) -> Void) {
        
        Alamofire.request(InstalookRouter.login(email: email, password: password))
            .responseObject { (response: DataResponse<User>) in
                
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
                
                if let user = response.result.value {
                    completionHandler(user)
                } else {
                    completionHandler(nil)
                }
        }
    }
}
