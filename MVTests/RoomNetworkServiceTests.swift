//
//  RoomNetworkServiceTests.swift
//  MVTests
//
//  Created by Apple on 13/05/22.
//

import XCTest
@testable import MV

class RoomNetworkServiceTests: XCTestCase {
    var roomNwService: RoomNetworkService!
    
    override func setUp() {
        super.setUp()
    }
    
    func setUpData() {
        self.roomNwService = RoomNetworkService()
    }
    
    func getUserDataTests() {
        let expected = XCTestExpectation(description: "load rooms from room Service")
        roomNwService.getData(URLConstants.shared.roomsUrl) { rooms, errorStr in
             XCTAssertNil(errorStr)
            expected.fulfill()
            self.wait(for: [expected], timeout: 10.0)
        }
    }
    
    func checkUserDataNil() {
        let expected = XCTestExpectation(description: "check room data nil or not")
        roomNwService.getData("https://userdetails.com") { rooms, errorStr in
             XCTAssertNotNil(errorStr)
            expected.fulfill()
            self.wait(for: [expected], timeout: 10.0)
        }
    }
}
