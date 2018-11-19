//
//  CellHotelCollection.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 12/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellHotelCollection: UICollectionViewCell {
    
    var urlImage: String?{
        didSet{
            if let url = urlImage{
                hotelImage.loadImageUsingUrlString(urlString: url)
            }
        }
    }
    
    @IBOutlet weak var hotelImage: CustomImageView!
    @IBOutlet weak var hotelName: UILabel!
    @IBOutlet weak var hotelValue: UILabel!
    
}
