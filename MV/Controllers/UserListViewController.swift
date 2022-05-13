//
//  UserListViewController.swift
//  MV
//
//  Created by Apple on 12/05/22.
//

import UIKit

class UserListViewController: BaseVC {
    @IBOutlet weak var tableView: UITableView!
    
    var userViewModel: UserListViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Users"
        self.setup()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setup() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.userViewModel = UserListViewModel.init(delegate: self, userService: UserService())
        self.tableView.register(UINib.init(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        self.startLoader()
        self.userViewModel.getUserData()
    }
}

extension UserListViewController: DataRefresh {
    func refreshData() {
        DispatchQueue.main.async {
            self.stopLoader()
            self.tableView.reloadData()
        }
    }
    
    func showError(_ errorStr: String) {
        DispatchQueue.main.async {
            self.stopLoader()
            self.showAlert(errorStr)
        }
    }
}

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userViewModel.userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let user = self.userViewModel.userList[indexPath.row]
        cell.loadDataIntoCell(user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        vc.userDetailsViewModel = UserDetailsViewModel.init(user: self.userViewModel.userList[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
