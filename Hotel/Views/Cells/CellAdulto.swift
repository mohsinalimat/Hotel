//
//  CellAdulto.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 06/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellAdulto: UITableViewCell {
    
    @IBOutlet weak var lblAdulto: UILabel!
    @IBOutlet weak var viewMaisAdulto: UIView!
    @IBOutlet weak var btnMenosAdulto: UIButton!
    @IBOutlet weak var btnMaisAdulto: UIButton!
    @IBOutlet weak var viewMenosAdulto: UIView!
    
    var qtdAdultos = 1{
        didSet{
            lblAdulto.text = "\(qtdAdultos) \(qtdAdultos > 1 ? "Adultos":"Adulto")"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        configureButtons()
        configureViews()
        
        lblAdulto.text = "\(qtdAdultos) Adulto"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureButtons(){
        btnMaisAdulto.setImage(UIImage(named: "more")?.imageWithColor(color: UIColor.white), for: .normal)
        btnMenosAdulto.setImage(UIImage(named: "less")?.imageWithColor(color: UIColor.red), for: .normal)
        btnMaisAdulto.addTarget(self, action: #selector(addAdulto), for: .touchDown)
        btnMenosAdulto.addTarget(self, action: #selector(removeAdulto), for: .touchDown)
    }
    
    func configureViews(){
        viewMaisAdulto.layer.borderWidth = 1
        viewMaisAdulto.layer.cornerRadius = 3
        viewMaisAdulto.layer.borderColor = UIColor.red.cgColor
        
        viewMenosAdulto.layer.borderWidth = 1
        viewMenosAdulto.layer.cornerRadius = 3
        viewMenosAdulto.layer.borderColor = UIColor.red.cgColor
    }

    @objc func addAdulto(){
        if qtdAdultos <= 4{
            qtdAdultos += 1
        }
    }
    
    @objc func removeAdulto(){
        if qtdAdultos != 1{
            qtdAdultos -= 1
        }
    }
}
