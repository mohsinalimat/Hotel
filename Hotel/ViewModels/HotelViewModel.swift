//
//  HotelViewModel.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 07/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation

class HotelViewModel {
    
    var quartos: Dynamic<[Quarto]> = Dynamic([])
    
    init() {
        var initQuarto = Quarto()
        initQuarto.adultos = 1
        initQuarto.criancas = []
        quartos.value.append(initQuarto)
    }
}
