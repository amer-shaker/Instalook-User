//
//  SalonCellTableViewCell.swift
//  Instalook-User
//
//  Created by jets on 5/31/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit
import Cosmos

class SalonCellTableViewCell: UITableViewCell, SearchCellView {
    
    // MARK: Outlets
    @IBOutlet weak var salonImage: UIImageView!
    @IBOutlet weak var salonName: UILabel!
    @IBOutlet weak var salonAddress: UILabel!
    
    @IBOutlet weak var salonRate: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        salonName.adjustsFontForContentSizeCategory = true
        salonAddress.adjustsFontForContentSizeCategory = true
    }
    
    func displayName(name: String) {
        salonName.text = name
    }
    
    func displayAddress(address: String) {
        salonAddress.text = address
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
