//
//  ReservationInteractor.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import Alamofire

class ReservationInteractor {
    
    public func getAllUserReservations(userId:Int,
                                       commplesionHandler: @escaping (_ reservations :Array<Reservation>?) -> Bool) {
        Alamofire.request(InstalookRouter.allUserReservation(userId: userId))
            .responseArray {(response: DataResponse<[Reservation]>) in
                print("response anas: \(response)")
                if let response = response.data {
                    print("Response Data reservation: \(response)")
                } else {
                    print("Response Data reservation : nil")
                }
                
                if let request = response.request {
                    print("Response Request reservation: \(request)")
                    print("Response Request HTTP method reservation: \(request.httpMethod!)")
                    
                    if let header = request.value(forHTTPHeaderField: NetworkingConstants.contentType) {
                        print("Response Request HTTP method: \(header)")
                    }
                } else {
                    print("Response Request reservation: nil")
                }
                
                if let responseStatusCode = response.response {
                    print("Response Status Code reservation: \(responseStatusCode.statusCode)")
                } else {
                    print("Response Status Code: nil")
                }
                
                if let error = response.error {
                    print("Response Error Code reservation: \(error.localizedDescription)")
                } else {
                    print("Response Error Code reservation: nil")
                }
                
                if let reservations = response.result.value {
                    print("reservation count from Interactor : \(reservations.count)")
                    commplesionHandler(reservations)
                } else {
                    print("NO DATA FROM REQUEST")
                    commplesionHandler(nil)
                }
                
        }
    }
}
