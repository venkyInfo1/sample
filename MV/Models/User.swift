//
//  User.swift
//  MV
//
//  Created by Apple on 11/05/22.
//

import Foundation

struct User: Codable {
    let createdAt, firstName: String
    let avatar: String
    let lastName, email, jobtitle, favouriteColor: String
    let id: String
    let data: MeetingData?
    let to, fromName: String?
}

struct MeetingData: Codable {
    let title, body, id, toID: String
    let fromID, meetingid: String

    enum CodingKeys: String, CodingKey {
        case title, body, id
        case toID = "toId"
        case fromID = "fromId"
        case meetingid
    }
}

