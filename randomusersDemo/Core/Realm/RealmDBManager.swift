//
//  RealmDBManager.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 17/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import RealmSwift

class RealmDBManager {
    
    public static var shared = RealmDBManager.init()
    
    func realmDB() throws -> Realm {
        guard let db = try? Realm(configuration: .defaultConfiguration) else {
            Log.logError((DBError.dbNotInitialized, nil))
            throw DBError.dbNotInitialized
        }
        return db
    }
}
