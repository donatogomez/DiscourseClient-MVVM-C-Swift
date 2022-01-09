//
//  CategoryDetailViewModel.swift
//  DiscourseClient
//
//  Created by Donato Gomez on 7/1/22.
//

import Foundation

final class CategoryDetailViewModel: ViewModel {
    
    let categoryId: Int
    let coordinator: CategoryDetailCoordinator
    
    var onCategoryDetailSuccess: ((String, String) -> Void)?
    var onCategoryDetailError: ((String) -> Void)?
    
    init(categoryId: Int, coordinator: CategoryDetailCoordinator) {
        self.categoryId = categoryId
        self.coordinator = coordinator
    }
    
    func fetchCategoryDetail() {
        let categoryDetailRequest = CategoryDetailRequest(id: categoryId)
        session.request(request: categoryDetailRequest) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let response = response else { return }
                self.onCategoryDetailSuccess?("\(response.category.id)", response.category.name)
                
            case .failure(let error):
                self.onCategoryDetailError?(error.localizedDescription)
            }
        }
    }
}
