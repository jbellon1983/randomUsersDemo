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
    func createOrUpdate(class: AnyClass) throws {
        guard let db = try? Realm(configuration: .defaultConfiguration) else {
            Log.logError((DBError.dbNotInitialized, nil))
            throw DBError.dbNotInitialized
        }
        var ent = [Object]()
        self.forEach { entity in
            if let e = (entity as? RealmConvertible)?.toRealmEntity() {
                ent.append(e)
            }
        }
        try db.write {
            db.add(ent, update: true)
        }
    }
}
