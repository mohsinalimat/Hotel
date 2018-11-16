//
//  Room.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 09/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation

struct Room: Decodable {
    var Name: String?
    var Description: String?
    var MainPhotoPath: String?
    var Photos: [String]?
}
