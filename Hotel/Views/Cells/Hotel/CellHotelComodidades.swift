//
//  CellHotelComodidades.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 19/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellHotelComodidades: UITableViewCell {
    
    @IBOutlet weak var btnVerMais: UIButton!
    @IBOutlet weak var auxView: UIView!
    
    var delegate: HeightCells?
    
    var yPosition: CGFloat = 2
    var comodidades: [Comodidade]?{
        didSet{
            if let coms = comodidades{
                for comodidade in coms{
                    
                    let label = UILabel(frame: CGRect(x: 1, y: yPosition, width: auxView.frame.width - 32, height: 35))
                    label.text = "• " + comodidade.Name!
                    label.font = UIFont.systemFont(ofSize: 17)
                    label.adjustsFontSizeToFitWidth = true
                    label.numberOfLines = 0
                    label.textColor = UIColor.darkGray
                    
                    auxView.addSubview(label)
                    yPosition += CGFloat(36)
                }
            }
        }
    }
    //var delegate

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func verMais(_ sender: UIButton) {
        
        if let del = delegate{
            if sender.titleLabel?.text == "Ver mais"{
                del.expandirCell(row: .comodidades)
            }else{
                del.contrairCell(row: .comodidades)
            }
        }
    }
}
