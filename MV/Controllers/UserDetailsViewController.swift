//
//  UserDetailsViewController.swift
//  MV
//
//  Created by Apple on 13/05/22.
//

import UIKit

class UserDetailsViewController: BaseVC {
    @IBOutlet weak var userImage: ImageLoader!
    @IBOutlet weak var mailIdLabel: UILabel!
    @IBOutlet weak var favourateColorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    
    var userDetailsViewModel: UserDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "User Details"
        self.setupData()
    }
    
    func setupData() {
        let user = self.userDetailsViewModel.user
        self.mailIdLabel.text = user.email
        self.nameLabel.text = user.firstName + " " + user.lastName
        self.jobLabel.text = user.jobtitle
        self.userImage.layer.cornerRadius = self.userImage.bounds.height/2
        self.favourateColorLabel.text = user.favouriteColor
        if let imageURL = URL(string: user.avatar) {
            self.userImage.loadImageWithUrl(imageURL)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
}
