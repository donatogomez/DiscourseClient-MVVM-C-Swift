//
//  UsersCoordinator.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import UIKit

final class UsersCoordinator: Coordinator {
    var navigator: UINavigationController
        
    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func start() {
        let usersViewModel = UsersViewModel(coordinator: self)
        let usersViewController = UsersViewController(viewModel: usersViewModel)
        usersViewController.title = "Users"
        
        usersViewModel.view = usersViewController

        navigator.pushViewController(usersViewController, animated: false)
    }
    
    func didSelect(userName: String) {
        let userDetailCoordinator = UserDetailCoordinator(navigator: navigator, userName: userName)
        userDetailCoordinator.start()
    }
}
