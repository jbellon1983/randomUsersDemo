//
//  UserModel.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 01/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import RealmSwift

class UserName : Object, Decodable {
    @objc dynamic var title: String
    @objc dynamic var first: String
    @objc dynamic var last: String
}

class Picture : Object, Decodable {
    @objc dynamic var large: String
    @objc dynamic var medium: String
    @objc dynamic var thumbnail: String
}

class Dob : Object, Decodable {
    @objc dynamic var age: Int
}

class User : Object, Decodable {
    
    @objc dynamic var gender: String
    @objc dynamic var email: String
    @objc dynamic var name: UserName? = nil
    @objc dynamic var picture: Picture? = nil
    @objc dynamic var dob: Dob? = nil
    
    override var hash: Int {
        return (name?.first ?? "" + email).hashValue
    }
    
    override static func primaryKey() -> String? {
        return "email"
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.email == rhs.email
    }
}

class Users : Decodable {
    let results: [User]
}
