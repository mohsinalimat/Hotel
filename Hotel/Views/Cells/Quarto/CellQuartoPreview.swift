//
//  CellQuarto.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 16/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellQuartoPreview: UITableViewCell {
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var lblRoomName: UILabel!
    var imagem: UIImage?{
        didSet{
           // thumbnail.image = imagem
        }
    }
}
