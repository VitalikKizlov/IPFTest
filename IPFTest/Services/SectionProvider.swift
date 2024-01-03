//
//  SectionProvider.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 03.01.2024.
//

import Foundation

struct SectionProvider {
    static let sections = [
        Section(id: UUID(), sectionType: .characters, imageName: "charactersImage"),
        Section(id: UUID(), sectionType: .locations, imageName: "locationsImage"),
        Section(id: UUID(), sectionType: .episodes, imageName: "episodesImage")
    ]
}
