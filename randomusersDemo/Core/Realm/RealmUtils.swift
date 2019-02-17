//
//  RealmUtils.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 03/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmConvertible {
    func toRealmEntity() -> Object
}

extension Array {
    func realmCreateOrUpdate(class: AnyClass) throws {
        if let db = try? RealmDBManager.shared.realmDB() {
            var ent = [Object]()
            self.forEach { entity in
                if let e = entity as? Object {
                    ent.append(e)
                }
            }
            try db.write {
                db.add(ent, update: true)
            }
        }
    }
}

extension Object {
    func save() throws -> Object? {
        if let db = try? RealmDBManager.shared.realmDB() {
            try db.write {
                db.add(self, update: true)
            }
            return self
        }
        return nil
    }
    
    static func getRealmObjectByPk(_ pk: Any, realmClass: Object.Type) -> Object? {
        if let db = try? RealmDBManager.shared.realmDB() {
            return db.object(ofType: realmClass, forPrimaryKey: pk)
        }
        return nil
    }
}
