//
//  ReservationInteractor.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import Alamofire

class ReservationInteractor
{

    public func getAllUserReservations(userId:Int,
                                       commplesionHandler:@escaping (_ reservations:Array<Reservation>?)->Bool)
    {
        Alamofire.request(InstalookRouter.allUserReservation(userId: userId))
            .responseObject { (response: DataResponse<Reservation>) in
                
                if let response = response.data {
                    print("Response Data: \(response)")
                } else {
                    print("Response Data: nil")
                }
                
                if let request = response.request {
                    print("Response Request: \(request)")
                    print("Response Request HTTP method: \(request.httpMethod!)")
                    
                    if let header = request.value(forHTTPHeaderField: NetworkingConstants.contentType) {
                        print("Response Request HTTP method: \(header)")
                    }
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
                
                if let reservations = response.result.value {
                    commplesionHandler([reservations])
                } else {
                    commplesionHandler(nil)
                }
        
    }
}
}
