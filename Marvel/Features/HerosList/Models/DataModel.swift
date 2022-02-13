//
//  DataModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 12/02/22.
//

import Foundation

struct DataModel: Codable {
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [HeroModel]
}
