//
//  Util.swift
//  Instalook-User
//
//  Created by jets on 5/26/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class Utils {
    
    public static func customizeProfileImage(borderImage: CGFloat, cornerRedius: CGFloat, imageView:UIView) -> UIView {
        imageView.layer.borderWidth = borderImage
        imageView.layer.cornerRadius = cornerRedius
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        return imageView
    }
}
