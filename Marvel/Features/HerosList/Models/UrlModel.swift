//
//  UrlModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 10/02/22.
//

import Foundation

struct UrlModel: Codable {
    let type: URLType
    let url: String
}

enum URLType: String, Codable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}

