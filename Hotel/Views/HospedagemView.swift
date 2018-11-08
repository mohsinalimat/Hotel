//
//  HospedagemView.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 05/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

protocol CustomCellCriancaIdade{
    func callViewCriancaIdade(data: AnyObject)
}

class HospedagemView: UITableViewController, CustomCellCriancaIdade {
    
    private let SEGUE_CRIANCA_IDADE = "segueToCriancaIdade"
    var hospedagemViewModel: HospedagemViewModel!
    
    var quartos: [Quarto] = [Quarto()]{
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigation()
        hospedagemViewModel.quartos.bind( {[unowned self] in self.quartos = $0} )
    }
    
    func configureNavigation(){
        title = "Hospedagem"
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return quartos.count + 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }else{
            return 2 + quartos[section - 1].criancas.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellQuarto") as! CellQuarto
            cell.viewModel = hospedagemViewModel
            return cell
        default:
            if indexPath.row == 0{
                return tableView.dequeueReusableCell(withIdentifier: "cellAdulto") as! CellAdulto
            }else if indexPath.row == 1{
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellCrianca") as! CellCrianca
                cell.currentSection = indexPath.section
                cell.viewModel = hospedagemViewModel
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "cellCriancaIdade") as! CellCriancaIdade
                cell.currentRow = indexPath.row
                cell.currentSection = indexPath.section - 1
                cell.delegate = self
                cell.viewModel = hospedagemViewModel
                return cell
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Quantidade de quartos"
        default:
            return "Quarto \(section)"
        }
    }
    
    func callViewCriancaIdade(data: AnyObject) {
        
        self.performSegue(withIdentifier: SEGUE_CRIANCA_IDADE, sender:data)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SEGUE_CRIANCA_IDADE{
            let vc = segue.destination as! ViewCriancaIdade
            let aux = sender as! [Int]
            vc.crianca = aux[1]
            vc.quarto = aux[0]
        }
    }
}
