//
//  BottomBar.swift
//  Rental-SwiftUI
//
//  Created by Kamleshwar Dhuria on 3/19/24.
//

import SwiftUI

struct BottomBar: View {
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                .frame(height: 80)
                .opacity(0.9)
                .overlay {
                    HStack{
                        Button {
                            // add action
                        } label: {
                            Image(systemName: "house.circle")
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "map.circle")
                        }
                        Spacer()
                        Button {
                            // add action
                        } label: {
                            Image(systemName: "cube.box")
                        }
                        Spacer()
                        Button {
                            // add action
                        } label: {
                            Image(systemName: "heart")
                        }
                    }.padding()
                }
        }
        .padding()
    }
}

#Preview {
    BottomBar()
}
