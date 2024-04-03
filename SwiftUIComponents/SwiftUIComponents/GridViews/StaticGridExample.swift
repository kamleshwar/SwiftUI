//
//  StaticGridExample.swift
//  SwiftUIComponents
//
//  Created by Kamleshwar Dhuria on 4/1/24.
//

import SwiftUI

// Example of Lazy Grids

struct StaticGridExample: View {
    @State private var isOn = false
    var body: some View {
        Grid(horizontalSpacing: 30) {
            GridRow {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(.red.gradient)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                
                VStack {
                    Circle()
                        .foregroundStyle(.secondary)
                        .frame(width: 60, height: 60)

                    Text("Dummy")
                }
                
                VStack {
                    Button("Tap me") {
                        
                    }.buttonStyle(.borderedProminent)
                    
                    Toggle("Wi-Fi", isOn: $isOn)
                }
            }
            Divider()
            GridRow {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(.teal.gradient)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                
                VStack {
                    Circle()
                        .foregroundStyle(.primary)
                        .frame(width: 60, height: 60)

                    Text("Dummy")
                }
                
                VStack {
                    Button("Tap me") {
                        
                    }.buttonStyle(.borderedProminent)
                    
                    Toggle("Wi-Fi", isOn: $isOn)
                }
            }
            Divider()
            GridRow {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                    .fill(.teal.gradient)
                    .frame(width: 200, height: 100)
                    .gridCellColumns(3)
            }
            Spacer()
        }.padding()
        
        
        
//        ScrollView(.horizontal) {
//            Section {
//                LazyHGrid(rows: rows, content: {
//                    ForEach(MockViewsData.dummy, id: \.id) { item in
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(item.color.gradient)
//                            .frame(width: 100)
//                    }
//                })
//            } header: {
//                Text("Horizontal")
//                    .font(.largeTitle.bold())
//                    .frame(maxWidth: .infinity, alignment: .leading)
//            }
//        }
    }
}

#Preview {
    StaticGridExample()
}

