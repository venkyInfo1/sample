//
//  URLSession+generic.swift
//  MV
//
//  Created by Apple on 11/05/22.
//

import Foundation
extension URLSession {
    enum ErrorType: Error {
        case invalidUrl
        case invalidData
    }
    // MARK: - Generic API Call
    func request<T: Codable>(urlRequest: URL?, codableType: T.Type,completion: @escaping (Result<T, Error>) -> ()) {
        guard let url = urlRequest else {
            completion(.failure(ErrorType.invalidUrl))
            return
        }
        let dataTask = dataTask(with: url) { data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(ErrorType.invalidData))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(codableType, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        dataTask.resume()
    }
}
