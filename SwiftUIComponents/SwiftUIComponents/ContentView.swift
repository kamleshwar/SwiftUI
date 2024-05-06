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
                    
                    NavigationLink {
                        ListHomeScreen()
                    } label: {
                        Text("List")
                    }
                    
                    NavigationLink {
                        ScrollViewExample1()
                    } label: {
                        Text("Scroll View")
                    }
                    
                    NavigationLink {
                        GridViewExample1()
                    } label: {
                        Text("Grid View")
                    }
                    
                    NavigationLink {
                        MenuItemViewExample()
                    } label: {
                        Text("Menu Item")
                    }
                    NavigationLink {
                        BGColorExample()
                    } label: {
                        Text("BG Color Examples")
                    }
                    
                }
            }
            .navigationTitle("UI Components")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
