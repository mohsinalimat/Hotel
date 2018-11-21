//
//  CellHotelContato.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 19/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellHotelContato: UITableViewCell {
    
    @IBOutlet weak var lblContato: UILabel!
    var fone1 = ""
    var fone2 = ""
    var rua = ""
    var bairro = ""
    var cidade = ""
    var estado = ""
    var pais = ""{
        didSet{
            lblContato.text = "\(cidade), \(bairro) - \(rua), \(cidade) - \(pais) \r\r Telefone 1: \(fone1) \r Telefone 2: \(fone2)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
