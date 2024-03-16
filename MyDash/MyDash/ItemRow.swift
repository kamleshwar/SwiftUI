//
//  ItemRow.swift
//  MyDash
//
//  Created by Kamleshwar Dhuria on 3/16/24.
//

import SwiftUI

struct ItemRow: View {
    let item: SubItem
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(.gray, lineWidth:2.0))
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions, id: \.self) { restriction in
                Text(restriction.rawValue)
                    .fontWeight(.black)
                    .padding(5)
                    .background(restriction.color)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ItemRow(item: SubItem.example)
}
