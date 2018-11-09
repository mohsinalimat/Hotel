//
//  CellCriancaIdade.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 06/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import UIKit

let notificationIdade = "notification_idade_crianca"

class CellCriancaIdade: UITableViewCell {
    
    @IBOutlet weak var lblIdadeCrianca: UILabel!
    @IBOutlet weak var btnIdadeCrianca: UIButton!
    
    var delegate: CustomCellCriancaIdade?
    let notificationKey = Notification.Name(rawValue: notificationIdade)
    
    var currentSection: Int?
    var currentRow : Int?
    var viewModel: HospedagemViewModel?{
        didSet{
            if let vm = viewModel {
                if let section = currentSection{
                    if let row = currentRow{
                        btnIdadeCrianca.setTitle("\(vm.quartos.value[section].criancas[row - 2].idade ?? 10) anos", for: .normal)
                        lblIdadeCrianca.text = "Idade criança \(row - 1)"
                    }
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureButton()
        createObservers()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func createObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateIdadeCrianca(notification:)), name: notificationKey, object: nil)
    }
    
    func configureButton(){
        
        btnIdadeCrianca.addTarget(self, action: #selector(escolherIdade), for: .touchDown)
    }
    
    @objc func updateIdadeCrianca(notification: NSNotification){
        let value = notification.object as! [Int]
        if let row = currentRow{
            if row - 1 == value[0]{
                btnIdadeCrianca.setTitle("\(value[1]) anos", for: .normal)
                viewModel?.updateCrianca(section: value[2], row: value[0], idade: value[1])
            }
        }
    }
    
    @objc func escolherIdade(){
        if let del = delegate{
            if let row = currentRow{
                del.callViewCriancaIdade(data: [currentSection, row - 1] as AnyObject)
            }
        }
    }
}
