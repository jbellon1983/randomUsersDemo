//
//  Errors.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 03/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation

enum DBError: Swift.Error {
    case dbNotInitialized
    case entityNotFound
    case unknown
}
