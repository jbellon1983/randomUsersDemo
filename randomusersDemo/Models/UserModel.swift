//
//  UserModel.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 01/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation

struct UserName : Decodable {
    let title: String
    let first: String
    let last: String
}

struct Picture : Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}

struct Dob : Decodable {
    let age: Int
}

struct User : Hashable, Decodable {
    let gender: String
    let name: UserName
    let email: String
    let picture: Picture
    let dob: Dob
    
    var hashValue: Int {
        return (name.first+email).hashValue
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.email == rhs.email
    }
}

struct Users : Decodable {
    let results: [User]
}

