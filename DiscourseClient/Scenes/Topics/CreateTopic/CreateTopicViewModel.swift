//
//  CreateTopicViewModel.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import Foundation

final class CreateTopicViewModel: ViewModel {
    
    let coordinator: CreateTopicCoordinator
    
    var onCreateTopicSuccess: (() -> Void)?
    var onCreateTopicError: ((String) -> Void)?
    
    init(coordinator: CreateTopicCoordinator){
        self.coordinator = coordinator
    }
    
    func onCloseButton() {
        coordinator.onCloseButton()
    }
    
    func onSubmitButtonTap(topicName: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let createdAt = dateFormatter.string(from: Date())
        
        let createTopicRequest = CreateTopicRequest(title: topicName, raw: topicName, createAt: createdAt)
        session.request(request: createTopicRequest) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.onCreateTopicSuccess?()
                
            case .failure(let error):
                self.onCreateTopicError?(error.localizedDescription)
            }
        }
    }
}
