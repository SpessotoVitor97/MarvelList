//
//  HerosModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 09/02/22.
//

import Foundation

struct HeroModel: Codable {
    let id: Int
    let name: String
    let description: String
    let modified: String
    let thumbnail: ThumbnailModel
    let resourceURI: String
    let comics: ComicsModel
    let series: ComicsModel
    let stories: StoriesModel
    let events: ComicsModel
    let urls: [UrlModel]
}
