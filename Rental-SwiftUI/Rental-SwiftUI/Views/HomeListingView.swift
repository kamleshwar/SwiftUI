//
//  HomeListingView.swift
//  Rental-SwiftUI
//
//  Created by Kamleshwar Dhuria on 3/19/24.
//

import SwiftUI

struct HomeListingView: View {
    let dataCard: HousesCards
    @State private var fav = false
    var body: some View {
        ZStack(alignment: .top, content: {
            Image(dataCard.photos+"1")
                .resizable()
                .clipShape(RoundedRectangle(cornerRadius: 20))
            VStack {
                HStack {
                    HStack(content: {
                        Text("Open House")
                            .bold()
                            .foregroundStyle(.white)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5).fill(.primary).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/))
                        Spacer()
                        Button {
                            fav.toggle()
                        } label: {
                            Image(systemName: fav ? "heart.fill": "heart")
                                .resizable()
                                .foregroundStyle(fav ? .red: .white)
                                .padding()
                                .frame(width: 50, height: 50)
                                .animation(.easeInOut(duration: 5), value: true)
                        }.buttonStyle(.borderless)
                    })
                }
                Spacer()
                VStack(alignment:.leading, content: {
                    HStack(content: {
                        Text(dataCard.direction)
                        Spacer()
                        Text("$ 5,430")
                    })
                    .bold()
                    .foregroundStyle(.black)
                    .font(.title2)
                   
                        
                    Text("5 Beds - 3 Bath - 12.39m")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    
                })
                .frame(height: 60)
                .padding()
                .background(RoundedRectangle(cornerRadius: 20).fill(.white).opacity(0.6))
            }
        })
        .frame(height: 300)
    }
}

#Preview {
    HomeListingView(dataCard: HousesCards(direction: "234, sdfsd sd ", state: "", price: 23432.0, room: "4", bathroom: "2", squareMeter: "2300", photos: "house1.", lat: 1.1, long: 1.1))
}
