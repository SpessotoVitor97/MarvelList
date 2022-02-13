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
    case parseFailed(Error)
}

class HerosService: HerosServiceProtocol {
    func fetchHeros(from url: String, completion: @escaping (Result<[HeroModel], Error>) -> Void) {
        let marvelService = MarvelService()
        
        marvelService.request(url: url) { result in
            switch result {
            case .success(let base):
                let heros = base.data.results
                completion(.success(heros))
            case.failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetch(hero: String, from url: String, completion: @escaping (Result<[HeroModel], Error>) -> Void) {
        
    }
}
