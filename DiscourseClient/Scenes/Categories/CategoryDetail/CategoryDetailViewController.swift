//
//  CategoryDetailViewController.swift
//  DiscourseClient
//
//  Created by Donato Gomez on 7/1/22.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    
    @IBOutlet weak var categoryNameLabel: UILabel!
    @IBOutlet weak var categoryIdLabel: UILabel!
    
    let viewModel: CategoryDetailViewModel
    
    init(viewModel: CategoryDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: "CategoryDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented")  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoading()
        }
        viewModel.fetchCategoryDetail()
    }
    
    func bindViewModel(){
        viewModel.onCategoryDetailSuccess = { [weak self] categoryId, categoryName in
            self?.hideLoading()
            self?.categoryIdLabel.text?.append(contentsOf: "    \(categoryId)")
            self?.categoryNameLabel.text?.append(contentsOf:"    \(categoryName)")
        }
        
        viewModel.onCategoryDetailError = { [weak self] error in
            self?.hideLoading()
            self?.showAlert(title: error)
        }
    }
}

