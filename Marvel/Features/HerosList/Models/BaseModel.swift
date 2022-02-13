//
//  BaseModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 12/02/22.
//

import Foundation

struct BaseModel: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: DataModel
}
