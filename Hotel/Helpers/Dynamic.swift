//
//  Dynamic.swift
//  Hotel
//
//  Created by WOOBA-MAC1 on 01/11/18.
//  Copyright © 2018 WOOBA-MAC1. All rights reserved.
//

import Foundation

import Foundation

class Dynamic<T> {
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
