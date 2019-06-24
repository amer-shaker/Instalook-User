//
//  SearchSalonsInteractor.swift
//  Instalook-User
//
//  Created by jets on 5/24/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class SearchInteractor {
    
    // properties
    var connectivity: NetworkConnectivity!
    
    // init
    init(){
        connectivity = NetworkConnectivity()
    }
    
    // MARK: - requests
    func getSalons(completionHandler: @escaping(_ salons: [Salon]?, _ error: String?) -> Void){
        
        connectivity.checkForReachability()
        
        if !(NetworkConnectivity.isConnectedToInternet()){
            completionHandler(nil, "Check your internet connectivity.")
            return
        }else{
            Alamofire.request(InstalookRouter.search()).responseArray{ (response: DataResponse<[Salon]>) in
                
                let result = response.result
                switch result {
                case .success(let salons):
                    completionHandler(salons, nil)
                case .failure(let error):
                    completionHandler(nil, error.localizedDescription)
                }
            }
        }
    }
    
    func getRate(salonId: Int, completionHandler: @escaping(_ rate: Int?, _ error: String?) -> Void){
        
        connectivity.checkForReachability()
        
        if !(NetworkConnectivity.isConnectedToInternet()){
            completionHandler(nil, "Check your internet connectivity.")
            return
        }else{
            Alamofire.request(InstalookRouter.salonRate(salonId: salonId)).responseJSON { response in
                
                let result = response.result
                switch result {
                case .success(let JSON):
                    print("myJSON are: \(JSON)")
                    let rate = JSON as! Int
                    print("1- rateeee \(rate)")
                    completionHandler(rate, nil)
                case .failure(let error):
                    completionHandler(nil, error.localizedDescription)
                }
            }
        }
    }
    func getSalonServices(salonId:Int, completionHandler: @escaping(_ salonServices: [SalonService]?, _ error: String?) -> Void){
        Alamofire.request(InstalookRouter.getSalonServices(salonId: salonId))
            .responseArray {(response: DataResponse<[SalonService]>) in
                print("response anas: \(response)")
                if let response = response.data {
                    print("Response SalonServices Data : \(response)")
                } else {
                    print("Response SalonServices Data : nil")
                }
                
                if let request = response.request {
                    print("Response Request SalonServices Data : \(request)")
                    print("Response Request HTTP method SalonServices Data : \(request.httpMethod!)")
                    
                    if let header = request.value(forHTTPHeaderField: NetworkingConstants.contentType) {
                        print("Response Request HTTP method: \(header)")
                    }
                } else {
                    print("Response Request SalonServices Data : nil")
                }
                
                if let responseStatusCode = response.response {
                    print("Response Status Code SalonServices Data : \(responseStatusCode.statusCode)")
                } else {
                    print("Response Status Code: nil")
                }
                
                if let error = response.error {
                    print("Response Error Code SalonServices Data : \(error.localizedDescription)")
                } else {
                    print("Response Error Code SalonServices Data : nil")
                }
                
                if let salonServices = response.result.value {
                    print("SalonServices count from Interactor : \(salonServices.count)")
                    completionHandler(salonServices, nil)
                } else {
                    print("NO DATA FROM REQUEST")
                    completionHandler(nil,"error : NO DATA FROM REQUEST")
                }
                
        }

        
    }
    
    func makeReservation(userId: Int,
                         barberId: Int,
                         date: String,
                         completionHandler: @escaping (Error?) -> Void) {
        let booking = Booking()
        booking.barberId = barberId
        booking.userId = userId
        booking.date = date
        
        Alamofire.request(InstalookRouter.book(booking: booking)).responseJSON {
            (response: DataResponse<Any>) in
            
            if let response = response.data{
                print("Response Data Booking: \(response)")
            } else {
                print("Response Data Booking : nil")
            }
            
            if let request = response.request {
                print("Response Request Booking: \(request)")
                print("Response Request HTTP method Booking: \(request.httpMethod!)")
                
                if let header = request.value(forHTTPHeaderField: NetworkingConstants.contentType) {
                    print("Response Request HTTP Booking method: \(header)")
                }
            } else {
                print("Response Request Booking: nil")
            }
            
            if let responseStatusCode = response.response {
                print("Response Status Code Booking: \(responseStatusCode.statusCode)")
            } else {
                print("Response Status Code: nil")
            }
            
            if let error = response.error {
                print("Response Error Code Booking: \(error.localizedDescription)")
            } else {
                print("Response Error Code Booking: nil")
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
    
    
    func getSalonBarbers(salonId:Int, completionHandler: @escaping(_ barbers: [Barber]?, _ error: String?) -> Void){
        Alamofire.request(InstalookRouter.getBarbers(salonId: salonId))
            .responseArray {(response: DataResponse<[Barber]>) in
                print("response anas: \(response)")
                if let response = response.data {
                    print("Response barbers Data : \(response)")
                } else {
                    print("Response barbers Data : nil")
                }
                
                if let request = response.request {
                    print("Response Request barbers Data : \(request)")
                    print("Response Request HTTP method barbers Data : \(request.httpMethod!)")
                    
                    if let header = request.value(forHTTPHeaderField: NetworkingConstants.contentType) {
                        print("Response Request HTTP method: \(header)")
                    }
                } else {
                    print("Response Request barbers Data : nil")
                }
                
                if let responseStatusCode = response.response {
                    print("Response Status Code barbers Data : \(responseStatusCode.statusCode)")
                } else {
                    print("Response Status Code: nil")
                }
                
                if let error = response.error {
                    print("Response Error Code barbers Data : \(error.localizedDescription)")
                } else {
                    print("Response Error Code barbers Data : nil")
                }
                
                if let barbers = response.result.value {
                    print("barbers count from Interactor : \(barbers.count)")
                    completionHandler(barbers, nil)
                } else {
                    print("NO DATA FROM REQUEST")
                    completionHandler(nil,"error : NO DATA FROM REQUEST")
                }
                
        }
    }

    
}
