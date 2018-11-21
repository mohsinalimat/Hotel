//
//  CellHotelDescricao.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 19/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellHotelDescricao: UITableViewCell {
    
    @IBOutlet weak var lblDescricao: UILabel!
    @IBOutlet weak var btnVerMais: UIButton!
    var delegate: HeightCells?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
    @IBAction func verMais(_ sender: UIButton) {
        
        if let del = delegate{
            if sender.titleLabel?.text == "Ver mais"{
                del.expandirCell(row: .descricao)
            }else{
                del.contrairCell(row: .descricao)
            }
        }
    }
}
