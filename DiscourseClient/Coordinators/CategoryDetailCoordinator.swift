//
//  CategoryDetailCoordinator.swift
//  DiscourseClient
//
//  Created by Donato Gomez on 6/1/22.
//

import UIKit

final class CategoryDetailCoordinator: Coordinator {
    
    var navigator: UINavigationController
    let categoryId: Int
    
    init(navigator: UINavigationController, categoryId: Int) {
        self.navigator = navigator
        self.categoryId = categoryId
    }
    
    func start() {
        let categoryDetailVM = CategoryDetailViewModel(categoryId: categoryId, coordinator: self)
        let categoryDetailVC = CategoryDetailViewController(viewModel: categoryDetailVM)
        categoryDetailVC.title = "Category detail"
                
        navigator.pushViewController(categoryDetailVC, animated: true)
    }
}
