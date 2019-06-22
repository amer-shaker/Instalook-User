//
//  NetworkConnectivity.swift
//  Instalook-User
//
//  Created by jets on 6/19/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import Alamofire


class NetworkConnectivity{
    
    var networkReachabilityManager = NetworkReachabilityManager()
    
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
    func checkForReachability() {
        networkReachabilityManager?.listener = { status in
            print("Network Status: \(status)")
            switch status {
            case .notReachable:
                print("network connection status - lost")
            case .reachable(NetworkReachabilityManager.ConnectionType.ethernetOrWiFi):
                print("network connection status - ethernet/WiFI")
            case .reachable(NetworkReachabilityManager.ConnectionType.wwan):
                print("network connection status - wwan")
            default:
                break
            }
        }
        networkReachabilityManager?.startListening()
    }
}
