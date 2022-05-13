//
//  RoomNetworkService.swift
//  MV
//
//  Created by Apple on 11/05/22.
//

import Foundation

class RoomNetworkService: ServiceGenericProtocol {
    typealias T = [Room]
    
    // MARK: - Call API to get Rooms Data
    func getData(_ urlStr: String,completion: @escaping (T,String?) -> Void) {
        let request = URL(string: urlStr)
        URLSession.shared.request(urlRequest: request, codableType: T.self) { result in
            switch result {
            case .success(let rooms):
                completion(rooms, nil)
            case .failure(let error):
                completion([],error.localizedDescription)
            }
        }
    }
}
