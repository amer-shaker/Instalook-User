//
//  SalonCellTableViewCell.swift
//  Instalook-User
//
//  Created by jets on 5/26/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit
import Cosmos
import SDWebImage

class SalonTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var salonName: UILabel!
    @IBOutlet weak var salonAddress: UILabel!
    @IBOutlet weak var salonRate: CosmosView!
    @IBOutlet weak var salonImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        salonName.adjustsFontForContentSizeCategory = true
        salonAddress.adjustsFontForContentSizeCategory = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

// MARK: - extension
extension SalonTableViewCell: SearchCellView{
    
    func displayName(name: String) {
        print("displayName")
        salonName.text = name
    }
    
    func displayAddress(address: String) {
        salonAddress.text = address
    }
    
    func displayImage(image: String){
        salonImage.sd_setImage(with: URL(string: image), placeholderImage: UIImage(named: "salonPlaceholder"))
    }
    
    func displayRate(rate: Int) {
        salonRate.rating = Double(rate)
    }
    
}
