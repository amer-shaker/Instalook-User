//
//  PointsCell.swift
//  Instalook-User
//
//  Created by jets on 5/29/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class PointsCell: UITableViewCell {

    @IBOutlet weak var salonName: UILabel!
    @IBOutlet weak var numberOfPoints: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        numberOfPoints =  Utils.customizeProfileImage(borderImage: 2.0, cornerRedius: numberOfPoints.frame.height/2,imageView: numberOfPoints) as! UILabel
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
