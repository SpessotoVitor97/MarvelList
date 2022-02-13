//
//  SotriesModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 13/02/22.
//

import Foundation

struct StoriesModel: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItemModel]
    let returned: Int
}
