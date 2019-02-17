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

//sourcery: AutoMockable
protocol UsersListViewModelProtocol {
    var users: BehaviorRelay<[RealmUser]> { get set }
    func loadMoreUsers(first: Bool)
}

class UsersListViewModel: UsersListViewModelProtocol {
    
    let searchText: BehaviorRelay<String>
    let usersService: UserServiceProtocol
    let disposeBag: DisposeBag
    
    var users = BehaviorRelay<[RealmUser]>.init(value: [])
    var page: Int = 0
    
    init(service: UserServiceProtocol = UserService()) {
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
            newusers.forEach({ (user) in
                let realmObject = user.toRealmEntity()
                if let realmUser = realmObject as? RealmUser  {
                    current.append(realmUser)
                }
            })            
            self.users.accept(current)
        }) { (error) in
            Log.logError(error)
        }
    }
    
    private func bindSubscribers() {
        users.subscribe { (users) in
            try? users.element?.realmCreateOrUpdate(class: RealmUser.self)
        }.disposed(by: disposeBag)
    }
}

