//
//  CollectionModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 10/02/22.
//

import Foundation

struct CollectionModel: Codable {

    let available: Int
    let collectionURI: String
    let items: [ItemsModel]
    let returned: Int
}
