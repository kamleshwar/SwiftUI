//
//  CountryModel.swift
//  CountriesSwiftUI
//
//  Created by Kamleshwar Dhuria on 3/20/24.
//

import Foundation

struct Country: Codable, Identifiable {
    var id: String?  {
        UUID().uuidString
    }
    var currency: Currency
    var flag: String
    var language: Language
    var name: String
    var region: Region
    var demonym: String?
    var capital: String
    var code: String
}

struct Currency: Codable {
    let code: String
    let name: String
    let symbol: String?
}

struct Language: Codable {
    let code: String?
    let name: String
    
    let iso6392, nativeName: String?
    
    enum CodingKeys: String, CodingKey {
        case code, name
        case iso6392 = "iso639_2"
        case nativeName
    }
}

enum Region: String, Codable {
    case af = "AF"
    case americas = "Americas"
    case an = "AN"
    case empty = ""
    case eu = "EU"
    case na = "NA"
    case oc = "OC"
    case regionAS = "AS"
    case sa = "SA"
}

