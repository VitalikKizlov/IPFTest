//
//  FilterOption.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 09.01.2024.
//

import Foundation

struct FilterOption: Hashable {
    let title: String
    var isSelected: Bool

    mutating func resetSelectedState() {
        isSelected = false
    }
}

struct SelectedOptions {
    let statusOption: FilterOption?
    let genderOption: FilterOption?
}
