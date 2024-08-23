//
//  ViewModel.swift
//  CountriesSwiftUI
//
//  Created by Kamleshwar Dhuria on 3/20/24.
//

import Foundation

class ViewModel: ObservableObject {
    let networkService: NetworkManager = NetworkManager()
    @Published var countryList: [Country] = []
    @Published var shouldShowError = false
    func fetchCountries() {
        Task { @MainActor in
            do {
                countryList = try await networkService.fetchData(.countries)
            } catch {
                shouldShowError = true
            }
        }
    }
}
