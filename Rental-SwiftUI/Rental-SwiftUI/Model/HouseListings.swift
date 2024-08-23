//
//  HouseListings.swift
//  Rental-SwiftUI
//
//  Created by Kamleshwar Dhuria on 3/19/24.
//

import Foundation

struct HousesCards: Identifiable, Hashable {
    var id: UUID = .init()
    var direction: String
    var state: String
    var price: Double
    var room: String
    var bathroom: String
    var squareMeter: String
    var photos: String
    var lat: Double
    var long: Double
}

var houseCards : [HousesCards] = [
    .init(direction: "49882 Shore dr", state: "Canton, MI, 48187", price: 451000, room: "4", bathroom: "6", squareMeter: "2,566", photos: "house1.", lat: 42.354528, long: -71.068369),
    .init(direction: "497 Reef dr", state: "Canton MI, 48187", price: 545000, room: "4", bathroom: "6", squareMeter: "3,500", photos: "house2.", lat: 52.354528, long: -81.068369)

]
