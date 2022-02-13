//
//  File.swift
//  Marvel
//
//  Created by Vitor Spessoto on 13/02/22.
//

import Foundation

struct StoriesItemModel: Codable {
    let resourceURI: String
    let name: String
    let type: ItemType
}

enum ItemType: String, Codable {
    case cover = "cover"
    case empty = ""
    case interiorStory = "interiorStory"
}
