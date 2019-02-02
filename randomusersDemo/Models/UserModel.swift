//
//  UserModel.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 01/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation

struct UserName : Codable {
    let title: String
    let first: String
    let last: String
}

struct User : Hashable, Codable {
    let gender: String
    let name: UserName
    let email: String
    
    var hashValue: Int {
        return (name.first+email).hashValue
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.email == rhs.email
    }
}

struct Users : Codable {
    let results: [User]
}

