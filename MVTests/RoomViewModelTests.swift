//
//  RoomViewModelTests.swift
//  MVTests
//
//  Created by Apple on 13/05/22.
//

import XCTest

@testable import MV

class RoomViewModelTests: XCTestCase {
    func testViewModel() {

        let data = [Room(createdAt: "12:12:2020", isOccupied: true, maxOccupancy: 2345, id: "1")]
        let mockNetwork = MockNetworkRoom(data: data, error: nil)

        let viewModel = RoomsViewModel(delegate: nil, roomNwService: mockNetwork)
        mockNetwork.request(url: "url") { rooms, errorStr in
            viewModel.rooms = rooms
            XCTAssertEqual(viewModel.rooms.count, 1)
        }
        
    }
}



class MockNetworkRoom: RoomNetworkService {
    let dataToReturn: [Room]
    let errorToReturn: Error?

    init(data: [Room], error: Error? = nil) {
        self.dataToReturn = data
        self.errorToReturn = error
    }

    func request(url: String, completion: @escaping ([Room], Error?) -> ()) {
        completion(self.dataToReturn, errorToReturn)
    }
}
