//
//  Service.swift
//  Marvel
//
//  Created by Vitor Spessoto on 10/02/22.
//

import Foundation

protocol HerosServiceProtocol {
    func fetchHeros(from url: String, completion: @escaping (Result<[HeroModel], Error>) -> Void)
}

enum CustomError: Error {
    case malformedURL
    case invalidResponse
    case apiError(String)
    case parseFailed(String)
}

class HerosService: HerosServiceProtocol {
    func fetchHeros(from url: String, completion: @escaping (Result<[HeroModel], Error>) -> Void) {
        guard let api = URL(string: url) else {
            completion(.failure(CustomError.malformedURL))
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: api) { (data, response, error) in
            
            guard let jsonData = data else {
                return completion(.failure(CustomError.invalidResponse))
            }
            
            if let errorMsg = error {
                return completion(.failure(CustomError.apiError(errorMsg.localizedDescription)))
            }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([HeroModel].self, from: jsonData)
                
                completion(.success(decoded))
            } catch let error {
                completion(.failure(CustomError.parseFailed(error.localizedDescription)))
            }
        }
        task.resume()
    }
}
