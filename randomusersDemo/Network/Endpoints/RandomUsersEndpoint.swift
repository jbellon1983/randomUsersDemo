//
//  RandomUsersEndpoint.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 01/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import Moya

enum UsersEndpoint {
    case users(page: Int?)
}

extension UsersEndpoint : TargetType {
    var baseURL: URL {
        return URL.init(string: "https://randomuser.me")!
    }
    
    var path: String {
        switch self {
        case .users:
            return "/api"
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .users(let page):
            var params: [String: Any] = [:]
            params["results"] = 30
            if let p = page {
                params["page"] = p
            }
            return params
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .users:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .users:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .users:
            return [:]
        }
    }
}

