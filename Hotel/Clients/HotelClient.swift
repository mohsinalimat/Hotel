//
//  HotelClient.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 08/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation

enum HotelFeed {
    case value(parameter: String)
}

extension HotelFeed: Endpoint{
    
    var name: String {
        return "name"
    }
    
    var value: String {

        switch self {
            case .value(let param): return "\(param)"
        }
    }
    
    var base: String {
        return "http://universities.hipolabs.com"
    }
    
    var path: String {
        return "/search"
    }
}

class HotelClient: APIClient {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    //in the signature of the function in the success case we define the Class type thats is the generic one in the API
    func getFeed( from hotelFeedType: HotelFeed, completion: @escaping (Result<[Hotel]?, APIError>) -> Void) {
        fetch(with: hotelFeedType.request, decode: { json -> [Hotel]? in
            guard let hotelFeedResult = json as? [Hotel] else { return  nil }
            return hotelFeedResult
        }, completion: completion)
    }
}
