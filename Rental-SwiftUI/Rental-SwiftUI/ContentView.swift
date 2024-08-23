//
//  ContentView.swift
//  Rental-SwiftUI
//
//  Created by Kamleshwar Dhuria on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    let houseList = houseCards
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom, content: {
                VStack(alignment: .trailing,  spacing:0, content: {
                    HomeHeader()
                    HomeSearchBar()
                    HStack(content: {
                        Text("Popular Places")
                            .bold()
                        Spacer()
                        Text("View All")
                            .foregroundStyle(.gray)
                            .font(.caption)
                    })
                    .padding(.vertical, 20)
                    ScrollView{
                        ForEach(houseList) { listing in
                            NavigationLink(value: listing) {
                                HomeListingView(dataCard: listing)
                            }
                            
                        }
                    }.navigationDestination(for: HousesCards.self, destination: { item in
                        DetailsView()
                    })
                    Spacer()
                })
            })
            .padding(10)
            .navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ContentView()
}
