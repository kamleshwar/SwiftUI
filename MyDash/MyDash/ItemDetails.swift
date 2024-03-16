//
//  ItemDetails.swift
//  MyDash
//
//  Created by Kamleshwar Dhuria on 3/16/24.
//

import SwiftUI

struct ItemDetails: View {
    let item: SubItem
    @EnvironmentObject var orrder: Order
    
    var body: some View {
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(item.mainImage)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(15)
                    
                    Text("Photo: \(item.photoCredit)")
                        .font(.caption)
                        .background(.black)
                        .foregroundColor(.white)
                        .offset(x: -10,y: -10)
                }
                
                Text(item.description)
                    .padding()
                
                Button("Order this") {
                    orrder.add(item: item)
                }
                .buttonStyle(.borderedProminent)
                Spacer()
            }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemDetails(item: SubItem.example)
            .environmentObject(Order())
    }
}
