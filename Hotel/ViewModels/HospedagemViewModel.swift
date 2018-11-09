//
//  QuartoViewModel.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 06/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation

class HospedagemViewModel {
    
    var quartos: Dynamic<[Quarto]> = Dynamic([])
    
    init() {
        quartos.value.append(Quarto())
    }
    
    func addQuarto(){
        quartos.value.append(Quarto())
    }
    
    func removeQuarto(){
        quartos.value.removeLast()
    }
    
    func removeCrianca(section: Int){
        quartos.value[section].criancas.removeLast()
    }
    
    func addCrianca(section: Int, idade: Int){
        var chd = Crianca()
        chd.idade = idade
        quartos.value[section].criancas.append(chd)
    }

    func updateCrianca(section: Int, row: Int, idade: Int){
        quartos.value[section].criancas[row - 1].idade = idade
    }
}
