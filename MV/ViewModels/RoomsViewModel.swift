//
//  RoomsViewModel.swift
//  MV
//
//  Created by Apple on 12/05/22.
//
// Created bt Venkatesh
import Foundation
protocol RoomsViewModelProtocol {
    var rooms: [Room] {get}
    func getRoomData()
}

class RoomsViewModel: RoomsViewModelProtocol {

    var rooms: [Room] = []
    private var roomNwService: RoomNetworkService!
    private let delegate: DataRefresh?
    
    init(delegate: DataRefresh?,roomNwService: RoomNetworkService) {
        self.delegate = delegate
        self.roomNwService = roomNwService
    }
    
    func getRoomData() {
        self.roomNwService.getData(URLConstants.shared.roomsUrl) { [weak self] roomData, erroStr in
            if let erroStr = erroStr {
                self?.delegate?.showError(erroStr)
            } else {
                self?.rooms = roomData
                self?.delegate?.refreshData()
            }
        }
    }
}
