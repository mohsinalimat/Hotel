//
//  Endereco.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 19/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation

struct Endereco: Decodable {
    var Street: String?
    var Neighborhood: String?
    var CityCode: String?
    var City: String?
    var StateCode: String?
    var State: String?
    var CountryCode: String?
    var Country: String?
    var ZipCode: String?
}
