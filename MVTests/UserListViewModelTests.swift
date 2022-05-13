//
//  UserListViewModelTests.swift
//  MVTests
//
//  Created by Apple on 13/05/22.
//

import XCTest

@testable import MV

class UserListViewModelTests: XCTestCase {
    func testViewModel() {

        let data = [User(createdAt: "12:12:2022", firstName: "abs", avatar: "image", lastName: "shj", email: "dhdk@gmail.com", jobtitle: "some", favouriteColor: "orange", id: "1", data: MeetingData(title: "s", body: "ddd", id: "1", toID: "23", fromID: "34", meetingid: "dd"), to: "12", fromName: "name")]
        let mockNetwork = MockNetwork(data: data, error: nil)

        let viewModel = UserListViewModel(delegate: nil, userService: mockNetwork)
        viewModel.userList = mockNetwork.dataToReturn
        XCTAssertEqual(viewModel.userList.count, 1)
    }
}



class MockNetwork: UserService {
    let dataToReturn: [User]
    let errorToReturn: Error?

    init(data: [User], error: Error? = nil) {
        self.dataToReturn = data
        self.errorToReturn = error
    }

    func request(url: String, completion: @escaping ([User], Error?) -> ()) {
        completion(self.dataToReturn, errorToReturn)
    }
}
