//
//  SectionProvider.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 03.01.2024.
//

import Foundation

struct SectionProvider {
    static let sections = [
        Section(sectionType: .characters, imageName: "charactersImage"),
        Section(sectionType: .locations, imageName: "locationsImage"),
        Section(sectionType: .episodes, imageName: "episodesImage")
    ]
}
