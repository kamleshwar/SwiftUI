//
//  ViewModel.swift
//  MyDash
//
//  Created by Kamleshwar Dhuria on 3/18/24.
//

import Foundation

class ViewModel: ObservableObject {
    let networkManager: NetworkManageable = NetworkManager()
    @Published var items : [Item] = []
    @Published var shouldShoError = false

    func fetchList() {
        Task { @MainActor in
            do {
                items = try await networkManager.makeNetworkCall(endpont: .items)
            } catch {
                shouldShoError = true
            }
        }
    }
}
