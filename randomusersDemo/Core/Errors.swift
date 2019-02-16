//
//  Errors.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 03/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import Moya

enum DBError: Swift.Error {
    case dbNotInitialized    
    case unknown
}

enum NetworkError: Swift.Error {
    case endpointFailed(endpoint: TargetType, message: String)
}

typealias AppError = (DBError?, NetworkError?)
