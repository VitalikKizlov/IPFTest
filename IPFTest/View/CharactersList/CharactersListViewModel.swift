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
    private var charactersHasBeenLoaded = false

    private let charactersService: CharactersServiceProtocol

    // MARK: - Init

    init(_ charactersService: CharactersServiceProtocol) {
        self.charactersService = charactersService
    }

    @MainActor
    func getCharactersList() async {
        guard !charactersHasBeenLoaded else { return }
        state = .loading
        do {
            let listInfo = try await charactersService.getCharactersList()
            self.charactersHasBeenLoaded = true
            self.state = .loaded(listInfo.results)
        } catch {
            self.state = .error
        }
    }
    
    @MainActor
    func applyFilters(_ options: SelectedOptions) async {
        state = .loading
        do {
            let listInfo = try await charactersService.filterCharacters(options)
            self.state = .loaded(listInfo.results)
        } catch {
            self.state = .error
        }
    }
}
