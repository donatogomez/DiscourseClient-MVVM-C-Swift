//
//  TopicDetailViewModel.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import Foundation

final class TopicDetailViewModel: ViewModel {
    
    let topicId: Int
    let coordinator: TopicDetailCoordinator
    
    var onTopicDetailSuccess: ((String, String) -> Void)?
    var onTopicDetailError: ((String) -> Void)?
    
    init(topicId: Int, coordinator: TopicDetailCoordinator) {
        self.topicId = topicId
        self.coordinator = coordinator
    }
    
    func fetchTopicDetail() {
        let topicDetailRequest = TopicDetailRequest(id: topicId)
        session.request(request: topicDetailRequest) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let response = response else { return }
                self.onTopicDetailSuccess?("\(response.id)", response.title)
                
            case .failure(let error):
                self.onTopicDetailError?(error.localizedDescription)
            }
        }
    }
}
