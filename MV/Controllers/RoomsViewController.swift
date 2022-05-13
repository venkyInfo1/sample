//
//  RoomsViewController.swift
//  MV
//
//  Created by Apple on 13/05/22.
//

import UIKit

class RoomsViewController: BaseVC {
    @IBOutlet weak var tableView: UITableView!
    var roomViewModel: RoomsViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Rooms"
        self.setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        self.tableView.rowHeight = UITableView.automaticDimension
        self.roomViewModel = RoomsViewModel.init(delegate: self, roomNwService: RoomNetworkService())
        self.tableView.register(UINib.init(nibName: "RoomTableViewCell", bundle: nil), forCellReuseIdentifier: "RoomTableViewCell")
        self.startLoader()
        self.roomViewModel.getRoomData()
    }
    
}


extension RoomsViewController: DataRefresh {
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

extension RoomsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.roomViewModel.rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTableViewCell", for: indexPath) as! RoomTableViewCell
        let room = self.roomViewModel.rooms[indexPath.row]
        cell.loadDataIntoCell(room)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.showAlert(self.roomViewModel.rooms[indexPath.row].isOccupied ? "Room is Full" : "Room is free occupy")
    }
}
