//
//  Room.swift
//  MV
//
//  Created by Apple on 11/05/22.
//

import Foundation

struct Room: Codable {
    let createdAt: String
    let isOccupied: Bool
    let maxOccupancy: Int
    let id: String
}
