//
//  ThumbnailModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 10/02/22.
//

import Foundation

struct ThumbnailModel: Codable {
    let path: String
    let thumbnailExtension: Extension

    enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

extension ThumbnailModel {
    var fullPath: String {
        return self.path + "." + self.thumbnailExtension.rawValue
    }
}
