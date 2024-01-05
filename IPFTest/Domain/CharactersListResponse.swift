//
//  CharactersListResponse.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import Foundation

struct CharactersListResponse: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count, pages: Int
}

struct Character: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    let image: String
}
