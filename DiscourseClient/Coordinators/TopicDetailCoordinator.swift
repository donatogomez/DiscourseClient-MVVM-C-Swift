//
//  TopicDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import UIKit

final class TopicDetailCoordinator: Coordinator {
    
    var navigator: UINavigationController
    let topicId: Int
    
    init(navigator: UINavigationController, topicId: Int) {
        self.navigator = navigator
        self.topicId = topicId
    }
    
    func start() {
        let topicDetailVM = TopicDetailViewModel(topicId: topicId, coordinator: self)
        let topicDetailVC = TopicDetailViewController(viewModel: topicDetailVM)
        topicDetailVC.title = "Topic detail"
                
        navigator.pushViewController(topicDetailVC, animated: true)
    }
}
