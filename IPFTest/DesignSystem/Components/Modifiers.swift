//
//  Modifiers.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 09.01.2024.
//

import SwiftUI

struct CustomToolBarModifier: ViewModifier {
    let title: String
    func body(content: Content) -> some View {
        return content
            .toolbar {
                CustomToolBarContent(title: title)
            }
    }
}
