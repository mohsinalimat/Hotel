//
//  APIClient.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 01/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation

class APICt {
    
    func get <T: Decodable>(url: String, decodingType: T.Type, completion: @escaping (T) -> Void){
        
        let url = URL(string: url)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in//(with: url!, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error!)
                return
            }
            
            if let data = data {
                do{
                    
                    let decoder = JSONDecoder()
                    let value = try decoder.decode(T.self, from: data)
                    
                    //let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    DispatchQueue.main.async {
                        completion(value)
                    }
                } catch {
                    
                }
            }
            }.resume()
    }
}
