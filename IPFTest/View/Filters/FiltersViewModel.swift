//
//  FiltersViewModel.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 09.01.2024.
//

import Foundation
import Combine

final class FiltersViewModel: ObservableObject {
    @Published var selectedStatusFilterOption: FilterOption?
    @Published var selectedGenderFilterOption: FilterOption?

    @Published private(set) var statuses: [FilterOption] = []
    @Published private(set) var genders: [FilterOption] = []

    private var subscriptions: Set<AnyCancellable> = []

    init() {
        prepareFilterSections()
        setupSubscriptions()
    }

    private func prepareFilterSections() {
        statuses = FilterProvider.statuses.map({ FilterOption(title: $0, isSelected: false) })
        genders = FilterProvider.genders.map({ FilterOption(title: $0, isSelected: false) })
    }

    private func setupSubscriptions() {
        $selectedStatusFilterOption
            .receive(on: DispatchQueue.main)
            .sink { [weak self] option in
                guard 
                    let self = self,
                    let option = option
                else { return }
                self.updateStatusSelectedState(option)
            }
            .store(in: &subscriptions)

        $selectedGenderFilterOption
            .receive(on: DispatchQueue.main)
            .sink { [weak self] option in
                guard
                    let self = self,
                    let option = option
                else { return }
                self.updateGenderSelectedState(option)
            }
            .store(in: &subscriptions)
    }

    func updateStatusSelectedState(_ status: FilterOption) {
        statuses.mutateEach { option in
            option.isSelected = option.title == status.title
        }
    }

    func updateGenderSelectedState(_ gender: FilterOption) {
        genders.mutateEach { option in
            option.isSelected = option.title == gender.title
        }
    }

    func resetSelectedStatusOptions() {
        self.statuses.mutateEach(by: { $0.resetSelectedState() })
        self.selectedStatusFilterOption = .none
    }

    func resetSelectedGenderOptions() {
        self.genders.mutateEach(by: { $0.resetSelectedState() })
        self.selectedGenderFilterOption = .none
    }

    func resetAllOptions() {
        resetSelectedStatusOptions()
        resetSelectedGenderOptions()
    }

    func selectedOptions() -> SelectedOptions {
        return SelectedOptions(statusOption: selectedStatusFilterOption, genderOption: selectedGenderFilterOption)
    }
}
