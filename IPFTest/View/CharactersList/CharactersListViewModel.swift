//
//  CharactersListViewModel.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import Foundation

final class CharactersListViewModel: ObservableObject {
    enum ViewState {
        case idle
        case loading
        case loaded([Character])
        case error
    }

    @Published private(set) var state: ViewState = .idle

    private let charactersService = CharactersService()

    @MainActor func getCharactersList() async {
        state = .loading
        do {
            let listInfo = try await charactersService.getCharactersList()
            print(listInfo.results.count)
            self.state = .loaded(listInfo.results)
        } catch {
            self.state = .error
        }
    }
}
