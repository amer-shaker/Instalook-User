//
//  FollowedSalonCell.swift
//  Instalook-User
//
//  Created by jets on 5/29/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class FollowedSalonCell: UITableViewCell {

    @IBOutlet weak var salonImage: UIImageView!
    @IBOutlet weak var salonName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        salonImage =  Utils.customizeProfileImage(borderImage: 2.0, cornerRedius: salonImage.frame.height/2,imageView: salonImage) as! UIImageView
        // Initialization code
    }
    override func prepareForReuse() {
        salonImage =  Utils.customizeProfileImage(borderImage: 2.0, cornerRedius: salonImage.frame.height/2,imageView: salonImage) as! UIImageView
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func followUnfollowSalon(_ sender: Any) {
    }
}
