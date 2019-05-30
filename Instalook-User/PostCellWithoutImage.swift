//
//  PostCellWithoutImage.swift
//  Instalook-User
//
//  Created by jets on 5/30/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class PostCellWithoutImage: UITableViewCell {

    @IBOutlet weak var postContentText: UILabel!
    @IBOutlet weak var salonUserName: NSLayoutConstraint!
    @IBOutlet weak var salonImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
