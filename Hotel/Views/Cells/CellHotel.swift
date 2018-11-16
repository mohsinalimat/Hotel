//
//  CellHotel.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 09/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellHotel: UITableViewCell {
    
    @IBOutlet weak var hotelImage: UIImageView!
    @IBOutlet weak var hotelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
