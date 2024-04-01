//
//  ContentView.swift
//  SwiftUIComponents
//
//  Created by Kamleshwar Dhuria on 4/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink {
                        ToggleButton()
                    } label: {
                        Text("Toggle Button")
                    }
                }
            }
        }
        .navigationTitle("UI Components")
        .padding()
    }
}

#Preview {
    ContentView()
}
