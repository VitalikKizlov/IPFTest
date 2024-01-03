//
//  Section.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 03.01.2024.
//

import Foundation

struct Section: Identifiable {
    let id: UUID
    let sectionType: SectionType
    let imageName: String
}

enum SectionType: String {
    case characters, locations, episodes

    var title: String {
        return self.rawValue.capitalized
    }
}
