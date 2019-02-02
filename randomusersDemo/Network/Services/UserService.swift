//
//  UserService.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 01/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import Result

protocol UserServiceProtocol {
    func getUsers(page: Int?, onSuccess: @escaping (([User]) -> Void), onError: @escaping ((Error) -> Void))
}

class UserService: UserServiceProtocol {
    let userProvider = MoyaProvider<UsersEndpoint>()
    let disposeBag = DisposeBag.init()
    
    func getUsers(page: Int?, onSuccess: @escaping (([User]) -> Void), onError: @escaping ((Error) -> Void)) {
        userProvider.rx.request(.users(page: page)).asObservable().subscribe(onNext: { (response) in
            let users = try? JSONDecoder().decode(Users.self, from: response.data)
            guard let result = users?.results else {
                onSuccess([])
                return
            }
            onSuccess(result)
        }, onError: { (error) in
            onError(error)
        }).disposed(by: disposeBag)
    }
}
