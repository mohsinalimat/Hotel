//
//  DestinosViewModel.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 01/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation

struct DestinosViewModel {
    
    var hoteis: Dynamic<[Hotel]> = Dynamic([])
    let client = HotelClient()
    
    func searchHotel(texto: String){
        client.getFeed(from: .value(parameter: texto), completion: { result in
            switch result{
            case .success(let hotelResults):
                guard let hoteis = hotelResults else { return }
                self.hoteis.value = hoteis
            case .failure(let error):
                print(error)
            }
        })
    }
}
