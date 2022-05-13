//
//  RoomTableViewCell.swift
//  MV
//
//  Created by Apple on 13/05/22.
//

import UIKit

class RoomTableViewCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var roomTitleLabel: UILabel!
    
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
        self.backView.setShadow()
    }
    
    func loadDataIntoCell(_ room: Room) {
        self.roomTitleLabel.text = "Room ID: \(room.id)"
        self.backView.backgroundColor = room.isOccupied ? .systemGreen : .white
    }
}
