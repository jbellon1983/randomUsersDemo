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
import RealmSwift

protocol UsersListViewModelProtocol {
    var users: BehaviorRelay<[User]> { get set }
    func loadMoreUsers(first: Bool)
}

class UsersListViewModel: UsersListViewModelProtocol {
    
    let searchText: BehaviorRelay<String>
    let usersService: UserService
    let disposeBag: DisposeBag
    
    var users = BehaviorRelay<[User]>.init(value: [])
    var page: Int = 0
    
    init(service: UserService = UserService()) {
        usersService = service
        disposeBag = DisposeBag.init()
        searchText = BehaviorRelay.init(value: "")
        bindSubscribers()
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
    
    private func bindSubscribers() {
        users.subscribe { (users) in
            try? users.element?.createOrUpdate(class: User.self)
        }.disposed(by: disposeBag)
    }
}

