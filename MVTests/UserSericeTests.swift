//
//  UserSericeTests.swift
//  MVTests
//
//  Created by Apple on 13/05/22.
//

import XCTest

@testable import MV
class UserSericeTests: XCTestCase {
    var userService: UserService!
    
    override func setUp() {
        super.setUp()
    }
    
    func setUpData() {
        self.userService = UserService()
    }
    
    func getUserDataTests() {
        let expected = XCTestExpectation(description: "load user details from Use Service")
        userService.getData(URLConstants.shared.usersListUrl) { userDdata, errorStr in
             XCTAssertNil(errorStr)
            expected.fulfill()
            self.wait(for: [expected], timeout: 10.0)
        }
    }
    
    func checkUserDataNil() {
        let expected = XCTestExpectation(description: "check user data nil or not")
        userService.getData("https://userdetails.com") { userDdata, errorStr in
             XCTAssertNotNil(errorStr)
            expected.fulfill()
            self.wait(for: [expected], timeout: 10.0)
        }
    }
}
