//
//  ThumbnailModel.swift
//  Marvel
//
//  Created by Vitor Spessoto on 10/02/22.
//

import Foundation

struct ThumbnailModel: Codable {
    let path: String
    let extensionField: String
}


//extension ThumbnailModel {
//    var fullPath: String {
//        return self.path + "." + self.extensionField
//    }
//}
