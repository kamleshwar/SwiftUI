//
//  HomeHeader.swift
//  Rental-SwiftUI
//
//  Created by Kamleshwar Dhuria on 3/19/24.
//

import SwiftUI

struct HomeHeader: View {
    let buttonAction: () = ()
    var body: some View {
        HStack {
            Button {
                buttonAction
            } label: {
                Text("Home")
                    .bold()
                    .padding()
                    .foregroundStyle(.primary)
                    .frame(height: 50)
                    .background(RoundedRectangle(cornerRadius: 30).stroke( .primary ,lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/).fill(.white))
        }
            Spacer()
            Image(systemName: "bell.badge")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .padding()
            Image(systemName: "person.wave.2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width:30, height: 30)
        }
    }
}

#Preview {
    HomeHeader()
}
