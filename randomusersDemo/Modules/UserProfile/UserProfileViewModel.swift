//
//  UserProfileViewModel.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 03/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import RxSwift

protocol UserProfileViewModelProtocol {
    func saveFavourite()
}

class UserProfileViewModel : UserProfileViewModelProtocol {

    var user: BehaviorSubject<RealmUser?>
    
    init(email: String) {
        print(email)
        if let realmUser = RealmUser.getRealmObjectByPk(email, realmClass: RealmUser.self) as? RealmUser {
            self.user = BehaviorSubject.init(value: realmUser)
            return
        }
        self.user = BehaviorSubject.init(value: nil)
    }
    
    func saveFavourite() {
        if let user = try? self.user.value(), let realmUser = user {
            try? realmUser.saveAsFavourite(!realmUser.isFav)
            self.user.on(Event.next(realmUser))
        }        
    }
}
