//
//  CreateTopicViewController.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import UIKit

class CreateTopicViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var topicTextfield: UITextField!
    
    let viewModel: CreateTopicViewModel
    
    init(viewModel: CreateTopicViewModel){
        self.viewModel = viewModel
        super.init(nibName: "CreateTopicViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    func bindViewModel() {
        viewModel.onCreateTopicSuccess = { [weak self] in
            self?.hideLoading()
            self?.showAlert(title: "Create topic success")
        }
        
        viewModel.onCreateTopicError = { [weak self] error in
            self?.hideLoading()
            self?.showAlert(title: error)
        }
    }

    @IBAction func submitButtonAction(_ sender: Any) {
        guard let text = topicTextfield.text, !text.isEmpty else {
            showEmptyTextfieldAlert()
            return
        }
        showLoading()
        viewModel.onSubmitButtonTap(topicName: text)
    }
    
    @IBAction func closeButtonAction(_ sender: Any) {
        viewModel.onCloseButton()
    }
    
    func showEmptyTextfieldAlert() {
        showAlert(title: "Empty textfield")
    }
    
}
