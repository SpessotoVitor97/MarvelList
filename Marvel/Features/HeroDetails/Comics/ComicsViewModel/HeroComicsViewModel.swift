//
//  HeroComicsViewModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 13/02/22.
//

import Foundation

class HeroComicsViewModel {
    
    var comicTitle: String?
    var comicImage: String?
    
    init(comicTitle: String, comicImage: String) {
        self.comicTitle = comicTitle
        self.comicImage = comicImage
    }
}
