//
//  CellHotelPoliticas.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 19/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellHotelPoliticas: UITableViewCell {
    
    @IBOutlet weak var lblPolitica: UILabel!
    @IBOutlet weak var btnVerMais: UIButton!
    @IBOutlet weak var lblCheckin: UILabel!
    @IBOutlet weak var lblCheckout: UILabel!
    var delegate: HeightCells?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func verMais(_ sender: UIButton) {
        
        if let del = delegate{
            if sender.titleLabel?.text == "Ver mais"{
                del.expandirCell(row: .politicas)
            }else{
                del.contrairCell(row: .politicas)
            }
        }
    }
}
