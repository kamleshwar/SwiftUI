//
//  GridViewExample1.swift
//  SwiftUIComponents
//
//  Created by Kamleshwar Dhuria on 4/1/24.
//

import SwiftUI

struct GridViewExample1: View {
    let rows = Array(repeating: GridItem(.flexible(minimum: 150)), count: 2)
    let adaptiveColumn = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        ScrollView(.horizontal) {
            Section {
                LazyHGrid(rows: rows, content: {
                    ForEach(MockViewsData.dummy, id: \.id) { item in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(item.color.gradient)
                            .frame(width: 100)
                    }
                })
            } header: {
                Text("Horizontal")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        
        
        ScrollView {
            LazyVGrid(columns: adaptiveColumn, content: {
                Section {
                    ForEach(MockViewsData.dummy, id: \.id) { item in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(item.color.gradient)
                            .frame(height: 100)
                    }
                } header: {
                    Text("Verticle")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            })
        }
    }
}

#Preview {
    GridViewExample1()
}
