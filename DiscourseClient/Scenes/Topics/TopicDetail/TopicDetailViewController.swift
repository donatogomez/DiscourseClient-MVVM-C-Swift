//
//  TopicDetailViewController.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import UIKit

class TopicDetailViewController: UIViewController {

    @IBOutlet weak var topicIdLabel: UILabel!
    @IBOutlet weak var topicNameLabel: UILabel!
    
    let viewModel: TopicDetailViewModel
    
    init(viewModel: TopicDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: "TopicDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented")  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoading()
        }
        viewModel.fetchTopicDetail()
    }
    
    func bindViewModel(){
        viewModel.onTopicDetailSuccess = { [weak self] topicId, topicTitle in
            self?.hideLoading()
            self?.topicIdLabel.text = topicId
            self?.topicNameLabel.text = topicTitle
        }
        
        viewModel.onTopicDetailError = { [weak self] error in
            self?.hideLoading()
            self?.showAlert(title: error)
        }
    }
}
