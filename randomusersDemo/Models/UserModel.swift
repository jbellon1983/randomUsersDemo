//
//  UserModel.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 01/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import RealmSwift

class UserName : NSObject, Decodable {
    var title: String
    var first: String
    var last: String
    
    override func value(forKey key: String) -> Any? {
        return self.findPropertyByReflection(key: key)
    }
}

class Picture : NSObject, Decodable {
    var large: String
    var medium: String
    var thumbnail: String
    
    override func value(forKey key: String) -> Any? {
        return self.findPropertyByReflection(key: key)
    }
}

class Dob : NSObject, Decodable {
    var age: Int
    
    override func value(forKey key: String) -> Any? {
        return self.findPropertyByReflection(key: key)
    }
}

class User : NSObject, Decodable, RealmConvertible {

    let gender: String
    let email: String
    var name: UserName? = nil
    var picture: Picture? = nil
    var dob: Dob? = nil
    
    func toRealmEntity() -> Object {
        let realmUser = RealmUser.init(value: self)
        return realmUser
    }
    
    override func value(forKey key: String) -> Any? {
        return self.findPropertyByReflection(key: key)
    }
}

class Users : Decodable {
    let results: [User]
}
