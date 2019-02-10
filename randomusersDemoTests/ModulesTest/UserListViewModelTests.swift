//
//  UserListViewModelTests.swift
//  randomusersDemoTests
//
//  Created by Jesus Bellon Quixal on 05/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import XCTest
import SwiftyMocky
@testable import randomusersDemo

class UserListViewModelTests: XCTestCase {
    
    var viewModel: UsersListViewModel!
    var service: UserServiceProtocolMock!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        service = UserServiceProtocolMock()
        viewModel = UsersListViewModel.init(service: service)
    }

    func testLoadMoreUsersFirstLoad() {
        // Test prepare
        // Test execution
        viewModel.loadMoreUsers(first: true)
        // Test verification
        Verify(service, .getUsers(page: .any, onSuccess: .any, onError: .any))
    }
    
    func testLoadMoreUsersPageLoad() {
        // Test prepare
        // Test execution
        viewModel.loadMoreUsers(first: false)
        // Test verification
        Verify(service, .getUsers(page: .any, onSuccess: .any, onError: .any))
    }
}
