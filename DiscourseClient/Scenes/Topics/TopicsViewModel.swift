//
//  TopicsViewModel.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 20/12/21.
//

import Foundation

protocol TopicsViewProtocol: AnyObject {
    func topicsFetched()
    func errorFetchingTopics()
}

final class TopicsViewModel: ViewModel {
    
    private var topics = [Topic]()
    weak var view: TopicsViewProtocol?
    let coordinator: TopicsCoordinator
    
    init(coordinator: TopicsCoordinator) {
        self.coordinator = coordinator
    }
    
    var topicsCount: Int {
        return topics.count
    }
    
    func fetchTopics() {
        let request = LatestTopicsRequest()
        session.request(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let topics = response?.topicList.topics else { return }
                self.topics = topics
                self.view?.topicsFetched()
                
            case .failure:
                self.view?.errorFetchingTopics()
            }
        }
    }
    
    func topic(from row: Int) -> Topic {
        return topics[row]
    }
    
    func onTapAddButton() {
        coordinator.onTapAddButton()
    }
    
    func didSelectRowAt(at row: Int) {
        coordinator.didSelect(topicId: topics[row].id) 
    }

}
