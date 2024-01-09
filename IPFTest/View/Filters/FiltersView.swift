//
//  FiltersView.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import SwiftUI

struct FiltersView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: FiltersViewModel
    let onFiltersApplied: () -> ()

    var body: some View {
            ZStack {
                Color(.primaryBlack)
                    .ignoresSafeArea()

                VStack(spacing: 24) {
                    FiltersGroupView(
                        title: "Status",
                        items: viewModel.statuses,
                        onFiltersReset: {
                            viewModel.resetSelectedStatusOptions()
                        },
                        selectedFilterOption: $viewModel.selectedStatusFilterOption
                    )
                    FiltersGroupView(
                        title: "Gender",
                        items: viewModel.genders,
                        onFiltersReset: {
                            viewModel.resetSelectedGenderOptions()
                        },
                        selectedFilterOption: $viewModel.selectedGenderFilterOption
                    )
                    Spacer()
                    Button {
                        onFiltersApplied()
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Apply filters")
                            .padding()
                            .foregroundColor(.primaryGreen)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(
                                    cornerRadius: 20,
                                    style: .continuous
                                )
                                .stroke(.primaryGreen, lineWidth: 2)
                            )
                    }
                    .padding()
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                            Text("Filter")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.primaryGreen)
                    }
                }
            }
        }
}

#Preview {
    FiltersView(viewModel: FiltersViewModel(), onFiltersApplied: {})
}
