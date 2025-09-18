//
//  URLConstants.swift
//  MV
//
//  Created by Apple on 12/05/22.
// Created by venkatesh

import Foundation
class URLConstants {
    static let shared = URLConstants()
    static let baseURL = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
    // MARK: - Get URL String
    var usersListUrl = baseURL + "people"
    var roomsUrl = baseURL + "rooms"
    var testURL = "testURL"
    private init() {}
}
