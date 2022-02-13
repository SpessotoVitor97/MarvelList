//
//  Service.swift
//  Marvel
//
//  Created by Vitor Spessoto on 10/02/22.
//

import Foundation

protocol HerosServiceProtocol {
    func fetchHeros(from url: String, completion: @escaping (Result<BaseModel, Error>) -> Void)
}

enum CustomError: Error {
    case malformedURL
    case invalidResponse
    case apiError(String)
    case parseFailed(Error)
}

class HerosService: HerosServiceProtocol {
    func fetchHeros(from url: String, completion: @escaping (Result<BaseModel, Error>) -> Void) {
        let marvelService = MarvelService()
        
        marvelService.request(url: url, completion: completion)
    }
    
    func fetch(hero: String, from url: String, completion: @escaping (Result<[HeroModel], Error>) -> Void) {
        
    }
}
