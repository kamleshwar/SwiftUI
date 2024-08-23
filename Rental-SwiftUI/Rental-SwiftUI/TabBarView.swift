//
//  TabBarView.swift
//  Rental-SwiftUI
//
//  Created by Kamleshwar Dhuria on 3/19/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem { Label("Home", systemImage: "house.circle") }
            MapView()
                .tabItem { Label("Map", systemImage: "map.circle") }
        }
    }
}

#Preview {
    TabBarView()
}
