//
//  MarvelService.swift
//  Marvel
//
//  Created by Vitor Spessoto on 10/02/22.
//

import Foundation

protocol MarvelServiceProtocol {
    func request<T>(url: String,
                    parameters: [String: String],
                    headers: [String: String]?,
                    completion: @escaping (Result<T, Error>) -> Void)
}

class MarvelService: MarvelServiceProtocol {
    
    func request<T>(url: String,
                    parameters: [String: String] = [:],
                    headers: [String: String]? = nil,
                    completion: @escaping (Result<T, Error>) -> Void) {
    }
}
