//
//  MarvelService.swift
//  Marvel
//
//  Created by Vitor Spessoto on 10/02/22.
//

import Foundation
import CryptoKit

protocol MarvelServiceProtocol {    
    func request(url: String,
                 parameters: [String: String],
                 headers: [String: String]?,
                 completion: @escaping (Result<BaseModel, Error>) -> Void)
}

class MarvelService: MarvelServiceProtocol {
    private var defaultUrl: String = "http://gateway.marvel.com/"
    private var apiKeys: [String : String] = ["publicKey": "3f361c79dee32e33e15872820eb214d1",
                                      "privateKey": "3172e3d644d18d381cef2b55313d43dc7020de0e"]
    
    func request(url: String,
                 parameters: [String: String] = [:],
                 headers: [String: String]? = nil,
                 completion: @escaping (Result<BaseModel, Error>) -> Void) {
        
        guard let url = URL(string: defaultUrl + url) else {
            completion(.failure(CustomError.malformedURL))
            return
        }
        
        let session = URLSession.shared
        
        let request = createRequest(from: url)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let jsonData = data else {
                return completion(.failure(CustomError.invalidResponse))
            }
            
            if let errorMsg = error {
                return completion(.failure(CustomError.apiError(errorMsg.localizedDescription)))
            }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(BaseModel.self, from: jsonData)
                completion(.success(decoded))
            } catch let error {
                completion(.failure(CustomError.parseFailed(error)))
            }
        }
        task.resume()
    }
    
    private func createRequest(from url: URL) -> URLRequest {
        
        var urlComponents = URLComponents(string: url.absoluteString)
        
        let timeStamp = "\(Int(Date().timeIntervalSince1970))"
        let privateKey = apiKeys["privateKey"]!
        let publicKey = apiKeys["publicKey"]!
        let hash = "\(timeStamp)\(privateKey)\(publicKey)"
        let md5Hash = convertToMd5(hash)
        
        let defaultParams: [String: String] = [
            "ts": timeStamp,
            "apikey": publicKey,
            "hash": md5Hash
        ]
        
        urlComponents?.queryItems = defaultParams.map({ (key, value) in
            URLQueryItem(name: key, value: value)
        })
        
        let request = URLRequest(url: (urlComponents?.url)!)
        
        return request
    }
    
    func convertToMd5(_ string: String) -> String {
        let digest = Insecure.MD5.hash(data: string.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
}
