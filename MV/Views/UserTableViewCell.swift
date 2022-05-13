//
//  UserTableViewCell.swift
//  MV
//
//  Created by Apple on 12/05/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var cellSubtitleLabel: UILabel!
    @IBOutlet weak var userImageView: ImageLoader!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.setupView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setupView() {
        self.userImageView.layer.cornerRadius = self.userImageView.bounds.height/2
        self.backView.setShadow()
    }
    
    func loadDataIntoCell(_ user: User) {
        self.cellSubtitleLabel.text = user.jobtitle
        self.cellTitleLabel.text = user.firstName + " " + user.lastName
        if let imageURL = URL(string: user.avatar) {
            self.userImageView.loadImageWithUrl(imageURL)
        }
    }
    
}
