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
    
}
