//
//  UserListViewModel.swift
//  MV
//
//  Created by Apple on 12/05/22.
//

import Foundation
protocol UserListViewModelProtocol {
    var userList: [User] {get}
    func getUserData()
}

protocol DataRefresh {
    func refreshData()
    func showError(_ errorStr: String)
}

class UserListViewModel: UserListViewModelProtocol {

    var userList: [User] = []
    private var userServices: UserService!
    private let delegate: DataRefresh?
    
    init(delegate: DataRefresh?,userService: UserService) {
        self.delegate = delegate
        self.userServices = userService
    }
    
    func getUserData() {
        self.userServices.getData(URLConstants.shared.usersListUrl) { [weak self] userList, erroStr in
            if let erroStr = erroStr {
                self?.delegate?.showError(erroStr)
            } else {
                self?.userList = userList
                self?.delegate?.refreshData()
            }
        }
    }
}

