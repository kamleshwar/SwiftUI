//
//  Order.swift
//  MyDash
//
//  Created by Kamleshwar Dhuria on 3/16/24.
//

import SwiftUI

class Order: ObservableObject {
    @Published var items = [SubItem]()

    var total: Int {
        items.reduce(0) { $0 + $1.price }
    }

    func add(item: SubItem) {
        items.append(item)
    }

    func remove(item: SubItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
