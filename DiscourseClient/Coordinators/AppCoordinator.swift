//
//  AppCoordinator.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 20/12/21.
//

import UIKit

final class AppCoordinator: Coordinator {
    var navigator: UINavigationController = UINavigationController()
    
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabBarController = UITabBarController()
        
        tabBarController.tabBar.tintColor = .black
        
        let topicsNavigator = UINavigationController()
        let topicsCoordinator = TopicsCoordinator(navigator: topicsNavigator)
        topicsCoordinator.start()
        
        let usersNavigator = UINavigationController()
        let usersCoordinator = UsersCoordinator(navigator: usersNavigator)
        usersCoordinator.start()
        
        let categoriesNavigator = UINavigationController()
        let categoriesCoordinator = CategoriesCoordinator(navigator: categoriesNavigator)
        categoriesCoordinator.start()
        
        tabBarController.viewControllers = [topicsNavigator, usersNavigator, categoriesNavigator]
        
        tabBarController.tabBar.items?.first?.image = UIImage(systemName: "list.dash")
        tabBarController.tabBar.items?[1].image = UIImage(systemName: "tag")
        tabBarController.tabBar.items?[2].image = UIImage(systemName: "person.3")

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
