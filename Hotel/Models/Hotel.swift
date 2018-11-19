//
//  Cidade.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 01/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation

struct Hotel: Decodable {
    
    var Name: String?
    var Rating: Int?
    var Description: String?
    var Photos: [String]?
    var RoomTypes: [Room]?
    
}
