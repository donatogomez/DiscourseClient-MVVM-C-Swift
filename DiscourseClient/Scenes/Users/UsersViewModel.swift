//
//  UsersViewModel.swift
//  DiscourseClient
//
//  Created by Donato Gómez Carrillo on 21/12/21.
//

import Foundation
protocol UsersViewProtocol: AnyObject {
    func usersFetched()
    func errorFetchingUsers()
}

final class UsersViewModel: ViewModel {
    
    private var users = [DirectoryItem]()
    weak var view: UsersViewProtocol?
    let coordinator: UsersCoordinator
    
    init(coordinator: UsersCoordinator) {
        self.coordinator = coordinator
    }
    
    func fetchUsers() {
        let request = UserRequest()
        session.request(request: request) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                guard let users = response?.directoryItems else { return }
                self.users = users
                self.view?.usersFetched()
                
            case .failure:
                self.view?.errorFetchingUsers()
            }
        }
    }
    
    var userCount: Int {
         return users.count
     }
    
    func users(from indexPath: IndexPath) -> DirectoryItem {
        return users[indexPath.row]
    }

    func didSelectRowAt(at indexPath: Int) {
        coordinator.didSelect(userName: users[indexPath].user.username)
    }
}
