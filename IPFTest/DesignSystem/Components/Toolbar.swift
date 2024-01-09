//
//  Toolbar.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 09.01.2024.
//

import SwiftUI

struct CustomToolBarContent: ToolbarContent {
    let title: String

    var body: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Text(title)
                .font(.system(size: 20, weight: .semibold))
                .foregroundColor(.primaryGreen)
        }
    }
}
