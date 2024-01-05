//
//  APIError.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import Foundation

enum APIError: Error {
    case decodingError(Data)
    case noInternetConnection
    case requestTimedOut
    case generic(Error)
    case responseNotValid
    case forbidden
    case notFound
    case clientError(Int)
}
