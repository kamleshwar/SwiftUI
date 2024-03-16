//
//  NetworkManager.swift
//  MyDash
//
//  Created by Kamleshwar Dhuria on 3/16/24.
//

import Foundation

enum Endpoints: String {
    case items = "https://run.mocky.io/v3/3b559be1-6bb4-4f5e-bdd9-3a39920db180"
}

protocol NetworkManageable {
    func makeNetworkCall(endpont: Endpoints) async throws -> [Item]
}

enum NetworkErorrs: Error {
    case invalidURL
    case failToFetchData(Error)
    
}

class NetworkManager: NetworkManageable {
    func makeNetworkCall(endpont: Endpoints) async throws -> [Item] {
        guard let url = URL(string: endpont.rawValue) else {
            return []
        }
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let fetchedData = try JSONDecoder().decode([Item].self, from: data)
        return fetchedData
    }
}
