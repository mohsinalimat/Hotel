//
//  CellButton.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 19/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellButton: UITableViewCell {
    
    @IBOutlet weak var btnAplicar: UIButton!
    var delegate: CustomCellCriancaIdade?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        btnAplicar.layer.cornerRadius = 8
        btnAplicar.addTarget(self, action: #selector(applyChanges), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func applyChanges(){
        if let del = delegate{
            del.popController()
        }
    }
}
