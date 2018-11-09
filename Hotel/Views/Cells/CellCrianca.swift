//
//  CellCrianca.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 06/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

class CellCrianca: UITableViewCell {
    
    @IBOutlet weak var lblCrianca: UILabel!
    @IBOutlet weak var viewMaisCrianca: UIView!
    @IBOutlet weak var btnMenosCrianca: UIButton!
    @IBOutlet weak var btnMaisCrianca: UIButton!
    @IBOutlet weak var viewMenosCrianca: UIView!
    
    var qtdCrianca: Int?
    var viewModel: HospedagemViewModel?{
        didSet{
            if let vm = viewModel{
                if let section = currentSection{
                    qtdCrianca = vm.quartos.value[section - 1].criancas.count
                    lblCrianca.text = "\(qtdCrianca!) \(qtdCrianca! > 1 ? "Crianças":"Criança")"
                }
            }
        }
    }
    
    var currentSection: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureButtons()
        configureViews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureButtons(){
        btnMaisCrianca.setImage(UIImage(named: "more")?.imageWithColor(color: UIColor.white), for: .normal)
        btnMenosCrianca.setImage(UIImage(named: "less")?.imageWithColor(color: UIColor.red), for: .normal)
        btnMaisCrianca.addTarget(self, action: #selector(addCrianca), for: .touchDown)
        btnMenosCrianca.addTarget(self, action: #selector(removeCrianca), for: .touchDown)
    }
    
    func configureViews(){
        viewMaisCrianca.layer.borderWidth = 1
        viewMaisCrianca.layer.cornerRadius = 3
        viewMaisCrianca.layer.borderColor = UIColor.red.cgColor
        
        viewMenosCrianca.layer.borderWidth = 1
        viewMenosCrianca.layer.cornerRadius = 3
        viewMenosCrianca.layer.borderColor = UIColor.red.cgColor
    }
    
    @objc func addCrianca(){
        if let qtd = qtdCrianca{
            if qtd <= 3{
                if let vm = viewModel{
                    vm.addCrianca(section: currentSection! - 1, idade: 10)
                }
            }
        }
    }
    
    @objc func removeCrianca(){
        if qtdCrianca != 0{
            if let vm = viewModel{
                vm.removeCrianca(section: currentSection! - 1)
            }
        }
    }
}
