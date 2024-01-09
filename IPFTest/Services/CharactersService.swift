//
//  CharactersService.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import Foundation

protocol CharactersServiceProtocol {
    func getCharactersList() async throws -> CharactersListResponse
    func filterCharacters(_ options: SelectedOptions) async throws -> CharactersListResponse
    func searchCharacters(_ text: String) async throws -> CharactersListResponse
}

struct CharactersService: CharactersServiceProtocol {
    let session: APISessionProviding

    init(session: APISessionProviding = ApiSession(.shared)) {
        self.session = session
    }

    func getCharactersList() async throws -> CharactersListResponse {
        let endpoint = CharactersEndpoint.characters
        return try await session.execute(endpoint)
    }

    func filterCharacters(_ options: SelectedOptions) async throws -> CharactersListResponse {
        let endpoint = CharactersEndpoint.filterCharacters(options)
        return try await session.execute(endpoint)
    }

    func searchCharacters(_ text: String) async throws -> CharactersListResponse {
        let endpoint = CharactersEndpoint.search(text)
        return try await session.execute(endpoint)
    }
}
