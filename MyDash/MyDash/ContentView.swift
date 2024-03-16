//
//  ContentView.swift
//  MyDash
//
//  Created by Kamleshwar Dhuria on 3/16/24.
//

import SwiftUI

struct ContentView: View {
    let networkManager: NetworkManageable = NetworkManager()
    @State var items : [Item] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(items) { item in
                        Section(item.name) {
                            ForEach(item.items) { subItem in
                                NavigationLink(value: subItem) {
                                    ItemRow(item: subItem)
                                }
                            }
                        }
                    }
                }
                .navigationDestination(for: SubItem.self, destination: { item in
                    ItemDetails(item: item)
                })
                .navigationTitle("Menu")
                .listStyle(.grouped)
                .onAppear{
                    Task {
                        items = try await networkManager.makeNetworkCall(endpont: .items)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
