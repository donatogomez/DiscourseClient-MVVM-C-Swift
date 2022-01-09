//
//  CategoriesViewModel.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import Foundation

protocol CategoriesViewProtocol: AnyObject {
    func categoriesFetched()
    func errorFetchingCategories()
}

final class CategoriesViewModel: ViewModel {
    
    private var categories = [Category]()
    weak var view: CategoriesViewProtocol?
    let coordinator: CategoriesCoordinator
    
    init(coordinator: CategoriesCoordinator) {
        self.coordinator = coordinator
    }
    
    var categoriesCount: Int {
        return categories.count
    }
    
    func fetchCategories() {
        let request = CategoriesRequest()
        session.request(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let categories = response?.categoryList.categories else { return }
                self.categories = categories
                self.view?.categoriesFetched()
                
            case .failure:
                self.view?.errorFetchingCategories()
            }
        }
    }
    
    func category(from row: Int) -> Category {
        return categories[row]
    }
    
    func didSelectRowAt(at row: Int) {
        coordinator.didSelect(categoryId: categories[row].id)
    }

}
