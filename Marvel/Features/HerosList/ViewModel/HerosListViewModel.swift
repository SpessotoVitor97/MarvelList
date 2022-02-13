//
//  HerosListViewModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 10/02/22.
//

import Foundation

protocol HerosListViewModelDelegate: AnyObject {
    func onSuccess()
    func onFailure(error: Error)
}

class HerosListViewModel {
    private let service: HerosService
    
    var heros = [HeroModel]()
    
    weak var delegate: HerosListViewModelDelegate?
    
    init(service: HerosService) {
        self.service = service
    }
    
    func loadHeros() {
        service.fetchHeros(from: "/v1/public/characters") { result in
            switch result{
            case .success(let heros):
                self.heros = heros
                self.delegate?.onSuccess()
                
            case .failure(let error):
                self.delegate?.onFailure(error: error)
            }
        }
    }
    
    func getHero(at indexPath: IndexPath) -> HeroModel {
        return heros[indexPath.row]
    }
    
    func getTotalHeros() -> Int {
        return heros.count
    }
}
