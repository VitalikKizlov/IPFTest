//
//  FilterProvider.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 09.01.2024.
//

import Foundation

struct FilterProvider {
    static let statuses: [String] = [Status.alive.rawValue, Status.dead.rawValue, Status.unknown.rawValue]
    static let genders: [String] = [Gender.female.rawValue, Gender.male.rawValue, Gender.genderless.rawValue, Gender.unknown.rawValue]
}
