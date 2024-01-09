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

struct Character: Codable, Hashable {
    let id: Int
    let name, species, type: String
    let status: Status
    let gender: Gender
    let image: String
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown
}

enum Gender: String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown
}
