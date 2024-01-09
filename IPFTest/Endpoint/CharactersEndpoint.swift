//
//  CharactersEndpoint.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import Foundation

enum CharactersEndpoint {
    case characters
    case filterCharacters(SelectedOptions)
}

extension CharactersEndpoint: RequestProviding {
    var method: HTTPMethod {
        return .get
    }

    var host: String {
        return "rickandmortyapi.com"
    }

    var path: String {
        switch self {
        case .characters, .filterCharacters:
            return "/api/character"
        }
    }

    var header: [String: String] {
        [:]
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .characters:
            return []
        case .filterCharacters(let options):
            let statusOption = options.statusOption
            let genderOption = options.genderOption
            var queryItems: [URLQueryItem] = []

            if let status = statusOption {
                let item = URLQueryItem(name: "status", value: status.title.lowercased())
                queryItems.append(item)
            }

            if let gender = genderOption {
                let item = URLQueryItem(name: "gender", value: gender.title.lowercased())
                queryItems.append(item)
            }

            return queryItems
        }
    }

    func urlRequest() -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Can't create URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        print("Request ----", request)
        return request
    }
}
