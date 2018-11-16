//
//  HotelsViewModel.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 09/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation

class HoteisViewModel{
    
    var hoteis: Dynamic<[Hotel]> = Dynamic([])
    
    init() {
        loadHotel()
    }
    
    func loadHotel(){
        
        let dataPath = Bundle.main.path(forResource: "json_hotel_2room", ofType: "json")
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: dataPath!), options: NSData.ReadingOptions.uncached)
            let main = try JSONDecoder().decode(Principal.self, from: data)
            hoteis.value = main.Properties!
        }catch let jsonError{
            print(jsonError.localizedDescription)
        }
        
    }
}
