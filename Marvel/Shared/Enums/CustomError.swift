//
//  CustomError.swift
//  Marvel
//
//  Created by Vitor Spessoto on 14/02/22.
//

import Foundation

enum CustomError: Error {
    case malformedURL
    case invalidResponse
    case apiError(String)
    case parseFailed(Error)
}
