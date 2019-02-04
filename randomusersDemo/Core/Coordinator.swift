//
//  Coordinator.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 02/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import UIKit

enum Modules {
    case usersList
    case userProfile(User)
}

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
    func navigateTo(module: Modules)
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    static let shared = MainCoordinator.init(navigationController: UINavigationController())
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = UsersListView.view(viewModel: UsersListViewModel.init(service: UserService()))
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateTo(module: Modules) {
        let vc: UIViewController
        switch module {
        case .usersList:
            vc = UsersListView.view(viewModel: UsersListViewModel.init(service: UserService.init()))
        case .userProfile(let user):
            vc = UserProfileView.view(viewModel: UserProfileViewModel.init(user: user))
        }
        navigationController.pushViewController(vc, animated: true)
    }
    
}
