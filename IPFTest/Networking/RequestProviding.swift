//
//  RequestProviding.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import Foundation

protocol RequestProviding {
    var method: HTTPMethod { get }
    var host: String { get }
    var path: String { get }
    var header: [String: String] { get }
    var queryItems: [URLQueryItem] { get }
    func urlRequest() -> URLRequest
}
