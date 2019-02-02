//
//  UsersViewModel.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 01/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol UsersViewModelProtocol {
    var users: BehaviorRelay<[User]> { get set }
    func loadMoreUsers(first: Bool)
}

class UsersViewModel: UsersViewModelProtocol {
    
    let searchText = BehaviorRelay(value: "")
    let usersService: UserService
    
    var users = BehaviorRelay<[User]>.init(value: [])
    var page: Int = 0
    
    init(service: UserService = RandomUserService()) {
        usersService = service
    }
    
    func loadMoreUsers(first: Bool) {
        if first {
            getUsers(page: 0)
        } else {
            self.page = self.page + 1
            getUsers(page: self.page)
        }
    }
    
    private func getUsers(page: Int) {
        usersService.getUsers(page: page, onSuccess: { (newusers) in
            var current = self.users.value
            current.append(contentsOf: newusers)
            self.users.accept(current)
        }) { (error) in
            
        }
    }
}

