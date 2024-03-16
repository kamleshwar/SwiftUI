//
//  MyDashApp.swift
//  MyDash
//
//  Created by Kamleshwar Dhuria on 3/16/24.
//

import SwiftUI

@main
struct MyDashApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
