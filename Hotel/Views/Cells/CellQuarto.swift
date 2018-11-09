//
//  CellQuarto.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 06/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellQuarto: UITableViewCell {
    
    @IBOutlet weak var lblQuarto: UILabel!
    @IBOutlet weak var viewMaisQuarto: UIView!
    @IBOutlet weak var btnMenosQuarto: UIButton!
    @IBOutlet weak var btnMaisQuarto: UIButton!
    @IBOutlet weak var viewMenosQuarto: UIView!
    
    var qtdQuartos: Int?
    var viewModel: HospedagemViewModel? {
        didSet{
            if let vm = viewModel{
                qtdQuartos = vm.quartos.value.count
                lblQuarto.text = "\(qtdQuartos!) \(qtdQuartos! > 1 ? "Quartos": "Quarto")"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib( )
        
        configureButtons()
        configureViews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func configureButtons(){
        btnMaisQuarto.setImage(UIImage(named: "more")?.imageWithColor(color: UIColor.white), for: .normal)
        btnMenosQuarto.setImage(UIImage(named: "less")?.imageWithColor(color: UIColor.red), for: .normal)
        btnMaisQuarto.addTarget(self, action: #selector(maisQuarto), for: .touchDown)
        btnMenosQuarto.addTarget(self, action: #selector(menosQuarto), for: .touchDown)
    }
    
    func configureViews(){
        viewMaisQuarto.layer.borderWidth = 1
        viewMaisQuarto.layer.cornerRadius = 3
        viewMaisQuarto.layer.borderColor = UIColor.red.cgColor
        
        viewMenosQuarto.layer.borderWidth = 1
        viewMenosQuarto.layer.cornerRadius = 3
        viewMenosQuarto.layer.borderColor = UIColor.red.cgColor
    }
    
    @objc func maisQuarto(){
        if let qtd = qtdQuartos{
            if qtd <= 3{
                if let vm = viewModel{
                    vm.addQuarto()
                }
            }
        }
    }
    
    @objc func menosQuarto(){
        if let qtd = qtdQuartos{
            if qtd != 1{
                if let vm = viewModel{
                    vm.addQuarto()
                }
            }
        }
    }
}
