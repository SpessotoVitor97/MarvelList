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
    let comics: CollectionModel?
    let series: CollectionModel?
    let stories: CollectionModel?
    let events: CollectionModel?
    let urls: [UrlModel]
}
