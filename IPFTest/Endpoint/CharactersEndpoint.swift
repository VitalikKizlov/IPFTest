//
//  CharactersEndpoint.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import Foundation

enum CharactersEndpoint {
    case characters
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
        case .characters:
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
//            return [
//                URLQueryItem(name: "lat", value: String(describing: coordinates.latitude)),
//                URLQueryItem(name: "lon", value: String(describing: coordinates.longitude)),
//                URLQueryItem(name: "stoptypes", value: "NaptanPublicBusCoachTram"),
//                URLQueryItem(name: "radius", value: "500"),
//                URLQueryItem(name: "app_key", value: Constants.transportForLondonKey)
//        ]
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
