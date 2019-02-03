//
//  UserProfileViewModel.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 03/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import RxSwift

class UserProfileViewModel {
    
    let user: BehaviorSubject<User>
    
    init(user: User) {
        self.user = BehaviorSubject.init(value: user)
    }
}
