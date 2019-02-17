//
//  UserModel.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 01/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUserName : Object {
    @objc dynamic var title: String = ""
    @objc dynamic var first: String = ""
    @objc dynamic var last: String = ""
}

class RealmPicture : Object {
    @objc dynamic var large: String = ""
    @objc dynamic var medium: String = ""
    @objc dynamic var thumbnail: String = ""
}

class RealmDob : Object {
    @objc dynamic var age: Int = 0
}

class RealmUser : Object {
    
    @objc dynamic var gender: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var name: RealmUserName? = nil
    @objc dynamic var picture: RealmPicture? = nil
    @objc dynamic var dob: RealmDob? = nil
    
    override var hash: Int {
        return (name?.first ?? "" + email).hashValue
    }
    
    override static func primaryKey() -> String? {
        return "email"
    }
    
    static func == (lhs: RealmUser, rhs: RealmUser) -> Bool {
        return lhs.email == rhs.email
    }
}
