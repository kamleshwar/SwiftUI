//
//  ContentView.swift
//  MyDash
//
//  Created by Kamleshwar Dhuria on 3/16/24.
//

import SwiftUI

struct ContentView: View {    
    @ObservedObject var videModel: ViewModel = ViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(videModel.items) { item in
                        Section(item.name) {
                            ForEach(item.items) { subItem in
                                NavigationLink(value: subItem) {
                                    ItemRow(item: subItem)
                                }
                            }
                        }
                    }
                }
                .refreshable {
                    videModel.fetchList()
                }
                .navigationDestination(for: SubItem.self, destination: { item in
                    ItemDetails(item: item)
                })
                .navigationTitle("Menu")
                .listStyle(.grouped)
                .task {
                    videModel.fetchList()
                }
                .alert("Something went wrong", isPresented: $videModel.shouldShoError) {
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
