//
//  UserService.swift
//  MV
//
//  Created by Apple on 11/05/22.
//

import Foundation

class UserService: ServiceGenericProtocol {
    
    typealias T = [User]
    
    // MARK: - Call API to get Users Data
    func getData(_ urlStr: String,completion: @escaping (T,String?) -> Void) {
        let request = URL(string: urlStr)
        URLSession.shared.request(urlRequest: request, codableType: T.self) { result in
            switch result {
            case .success(let users):
                completion(users, nil)
            case .failure(let error):
                completion([],error.localizedDescription)
            }
        }
    }
}
