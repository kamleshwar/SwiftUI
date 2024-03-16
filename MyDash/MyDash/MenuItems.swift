//
//  MenuItems.swift
//  MyDash
//
//  Created by Kamleshwar Dhuria on 3/16/24.
//

import Foundation
import SwiftUI

struct Item: Codable, Identifiable {
    let id: UUID
    let name: String
    let items: [SubItem]
}

// MARK: - Item
struct SubItem: Codable, Identifiable, Hashable {
    let id: UUID
    let name, photoCredit: String
    let price: Int
    let restrictions: [Restriction]
    let description: String
    
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    
    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
    
#if DEBUG
    static let example = SubItem(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: [.g, .v], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
#endif
}

enum Restriction: String, Codable {    
    case d = "D"
    case g = "G"
    case n = "N"
    case s = "S"
    case v = "V"
    
    var color: Color {
        switch self {
        case .d:
                .purple
        case .g:
                .green
        case .n:
                .orange
        case .s:
                .red
        case .v:
                .black
        }
    }
}
