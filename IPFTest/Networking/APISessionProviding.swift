//
//  APISessionProviding.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import Foundation

protocol APISessionProviding {
  func execute<T: Codable>(_ requestProvider: RequestProviding) async throws -> T where T : Decodable
}
