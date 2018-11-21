//
//  CellHotelInfo.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 21/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellHotelInfo: UITableViewCell {
    
    @IBOutlet weak var lblNomeHotel: UILabel!
    @IBOutlet weak var btnCompartilhar: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let image = btnCompartilhar.imageView?.image!
        btnCompartilhar.imageView?.image = image?.imageWithColor(color: UIColor.init(red: 0, green: 122/255, blue: 1, alpha: 1))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
