//
//  CharactersListViewModel.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import Foundation
import Combine

final class CharactersListViewModel: ObservableObject {
    enum ViewState {
        case idle
        case loading
        case loaded([Character])
        case error
    }

    @Published private(set) var state: ViewState = .idle
    @Published var searchText: String = ""
    private var searchTask: Task<Void, Never>?

    private var charactersHasBeenLoaded = false
    private var subscriptions: Set<AnyCancellable> = []
    private let charactersService: CharactersServiceProtocol

    // MARK: - Init

    init(_ charactersService: CharactersServiceProtocol) {
        self.charactersService = charactersService

        setupSubscriptions()
    }

    // MARK: - Private

    private func setupSubscriptions() {
        $searchText
            .debounce(for: 0.25, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .filter { value in
                return value.count > 1
            }
            .sink { [weak self] searchText in
                guard let self = self else { return }
                searchTask?.cancel()
                
                searchTask = Task {
                    await self.searchCharacters(searchText)
                }
            }
            .store(in: &subscriptions)
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

    @MainActor
    func searchCharacters(_ text: String) async {
        state = .loading
        do {
            let listInfo = try await charactersService.searchCharacters(text)
            self.state = .loaded(listInfo.results)
        } catch {
            self.state = .error
        }
    }
}
