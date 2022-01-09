//
//  UserDetailViewController.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    
    let viewModel: UserDetailViewModel
    
    init(viewModel: UserDetailViewModel){
        self.viewModel = viewModel
        super.init(nibName: "UserDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.showLoading()
        }
        viewModel.fetchUserDetail()
    }
    
    func bindViewModel(){
        viewModel.onUserDetailSuccess = { [weak self] userId, userName in
            self?.hideLoading()
            self?.userIdLabel.text?.append(contentsOf: "    \(userId)")
            self?.userNameLabel.text?.append(contentsOf: "    \(userName)")
        }
        
        viewModel.onUserDetailError = { [weak self] error in
            self?.hideLoading()
            self?.showAlert(title: error)
        }
    }
}
