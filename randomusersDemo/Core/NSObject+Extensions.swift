//
//  NSObject+Extensions.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 17/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation

extension NSObject {
    func findPropertyByReflection(key: String) -> Any? {
        let mirror = Mirror.init(reflecting: self)        
        let reflectionProperty = mirror.children.first { (label, _) -> Bool in
            return label == key
        }
        return reflectionProperty?.value
    }
}
