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
}
