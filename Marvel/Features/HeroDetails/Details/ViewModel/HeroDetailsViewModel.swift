//
//  HeroDetailsViewModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 13/02/22.
//

import Foundation
import UIKit

class HeroDetailsViewModel {
    var hero: HeroModel
    
    init(for hero: HeroModel) {
        self.hero = hero
    }
    
    func getTotalComics() -> Int {
        let total = hero.comics.items.count
        return total
    }
}
