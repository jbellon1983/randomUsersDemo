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
    
    override static func primaryKey() -> String? {
        return "first"
    }
}

class RealmPicture : Object {
    @objc dynamic var large: String = ""
    @objc dynamic var medium: String = ""
    @objc dynamic var thumbnail: String = ""

    override static func primaryKey() -> String? {
        return "thumbnail"
    }
}

class RealmDob : Object {
    @objc dynamic var age: Int = 0
    
    override static func primaryKey() -> String? {
        return "age"
    }
}

class RealmUser : Object {
    
    @objc dynamic var gender: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var name: RealmUserName? = nil
    @objc dynamic var picture: RealmPicture? = nil
    @objc dynamic var dob: RealmDob? = nil
    @objc dynamic var isFav: Bool = false
    
    override static func primaryKey() -> String? {
        return "email"
    }
        
    func saveAsFavourite(_ isFav: Bool) throws {
        if let db = try? RealmDBManager.shared.realmDB() {
            try db.write {
                self.isFav = isFav
                db.add(self, update: true)
            }
        }
    }
}
