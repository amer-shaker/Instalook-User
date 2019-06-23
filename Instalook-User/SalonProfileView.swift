//
//  SalonProfileView.swift
//  Instalook-User
//
//  Created by jets on 6/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import Foundation
import UIKit
protocol SalonProfileView {
    func showImage(image:UIImage)
    func showSalonName(name:String)
    func showSalonAddress(address:String)
    func showSalonRate()
     func showErrorAlert(error: String)
    func reloadData()
}
