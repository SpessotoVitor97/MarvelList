//
//  CollectionModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 10/02/22.
//

import Foundation

struct ComicsModel: Codable {
    let available: Int
    let collectionURI: String
    let items: [ComicsItemModel]
    let returned: Int
}
