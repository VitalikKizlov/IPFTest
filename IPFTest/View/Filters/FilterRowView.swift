//
//  FilterRowView.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 09.01.2024.
//

import SwiftUI

struct FilterRowView: View {
    let filterOption: FilterOption
    @Binding var selectedFilterOption: FilterOption?

    var body: some View {
        Button(action: {
            selectedFilterOption = filterOption
        }, label: {
            HStack(spacing: 24) {
                Circle()
                    .fill(filterOption.isSelected ? .primaryGreen : .white)
                    .frame(width: 24, height: 24)

                Text(filterOption.title)
                    .foregroundColor(filterOption.isSelected ? .primaryGreen : .white)
            }
        })
    }
}
