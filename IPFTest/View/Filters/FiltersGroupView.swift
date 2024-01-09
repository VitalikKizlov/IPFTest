//
//  FiltersGroupView.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 09.01.2024.
//

import SwiftUI

struct FiltersGroupView: View {
    let title: String
    let items: [FilterOption]
    let onFiltersReset: () -> ()
    @Binding var selectedFilterOption: FilterOption?

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            HStack {
                Text("Status")
                    .foregroundColor(.primaryGreen)
                Spacer()
                Button {
                    onFiltersReset()
                } label: {
                    Text("Reset")
                        .foregroundColor(.red)
                        .opacity(selectedFilterOption == nil ? 0.5 : 1)
                }
                .disabled(selectedFilterOption == nil)
            }
            VStack(alignment: .leading, spacing: 20) {
                ForEach(items, id: \.self) { item in
                    FilterRowView(filterOption: item, selectedFilterOption: $selectedFilterOption)
                }
            }
        }
        .padding()
    }
}
