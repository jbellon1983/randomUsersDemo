//
//  Coordinator.swift
//  randomusersDemo
//
//  Created by Jesus Bellon Quixal on 02/02/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = UsersListView.view(viewModel: UsersListViewModel.init(service: UserService()))
        navigationController.pushViewController(vc, animated: false)
    }
}

