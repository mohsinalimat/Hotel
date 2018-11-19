//
//  CellQuartoHotel.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 19/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellQuartoHotel: UITableViewCell {
    
    var urlImagem: String?{
        didSet{
            if let imageUrl = urlImagem{
                imagem.loadImageUsingUrlString(urlString: imageUrl)
            }
        }
    }

    @IBOutlet weak var imagem: CustomImageView!
    @IBOutlet weak var lblNomeQuarto: UILabel!
    
}
