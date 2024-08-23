//
//  NetworkManager.swift
//  CountriesSwiftUI
//
//  Created by Kamleshwar Dhuria on 3/20/24.
//

import Foundation

enum Endpoint: String {
    case countries
    
    var urlString: String? {
        switch self {
        case .countries:
            return "https://gist.githubusercontent.com/peymano-wmt/32dcb892b06648910ddd40406e37fdab/raw/db25946fd77c5873b0303b858e861ce724e0dcd0/countries.json"
        }
    }
}

enum ErrorCases: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

class NetworkManager {
    func fetchData(_ endpoint: Endpoint) async throws -> [Country] {
        guard let urlString = endpoint.urlString,
                let url = URL(string:urlString) else {
            throw ErrorCases.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }
        
        do {
            return try JSONDecoder().decode([Country].self, from: data)
        } catch { error
            print(error)
            throw ErrorCases.invalidData
        }
    }
}
