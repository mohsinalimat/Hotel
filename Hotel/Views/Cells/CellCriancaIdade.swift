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
    var viewModel: HospedagemViewModel?
    
    var currentRow = 2 {
        didSet{
            lblIdadeCrianca.text = "Idade Criança \(currentRow - 1)"
        }
    }
    
    var currentSection: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureLabel()
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
    
    func configureLabel(){
        lblIdadeCrianca.text = "Idade Criança \(currentRow - 1)"
    }
    
    @objc func updateIdadeCrianca(notification: NSNotification){
        let value = notification.object as! [Int]
        if currentRow - 1 == value[0]{
            btnIdadeCrianca.setTitle("\(value[1]) anos", for: .normal)
            viewModel?.addCrianca(section: value[2], row: value[0], idade: value[1])
        }
    }
    
    @objc func escolherIdade(){
        if let del = delegate{
            del.callViewCriancaIdade(data: [currentSection, currentRow - 1] as AnyObject)
        }
    }
}
