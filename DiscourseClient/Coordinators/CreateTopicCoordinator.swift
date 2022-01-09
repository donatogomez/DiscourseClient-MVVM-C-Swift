//
//  CreateTopicCoordinator.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import UIKit

final class CreateTopicCoordinator: Coordinator {
    var navigator: UINavigationController
    
    init(navigator: UINavigationController){
        self.navigator = navigator
    }
    
    func start() {
        let createTopicViewModel = CreateTopicViewModel(coordinator: self)
        let createTopicVC = CreateTopicViewController(viewModel: createTopicViewModel)
        createTopicVC.title = "Create Topic"
        
        navigator.present(createTopicVC, animated: true, completion: nil)
//        navigator.pushViewController(createTopicVC, animated: true)
    }
    
    func onCloseButton() {
        navigator.dismiss(animated: true, completion: nil)
    }
    
}
