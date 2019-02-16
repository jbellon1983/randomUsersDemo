//
//  Log.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 16/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation

class Log {
    
    static func log() {
        
    }
    
    static func logError(_ error: AppError) {
        logDbError(error.0)
        logNetworkError(error.1)
    }
    
    private static func logDbError(_ error: DBError?) {
        guard let err = error else { return }
        switch err {
        case .dbNotInitialized:
            print("ERROR: dbNotInitialized \(err.localizedDescription)")
        case .unknown:
            print("\(err.localizedDescription)")
        }
    }
    
    private static func logNetworkError(_ error: NetworkError?) {
        guard let err = error else { return }
        switch err {
        case .endpointFailed(let endpoint, let message):
            print("ERROR: endpointFailed \(endpoint.path) \(message)")            
        }
    }
}
