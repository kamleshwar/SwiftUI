//
//  HomeSearchBar.swift
//  Rental-SwiftUI
//
//  Created by Kamleshwar Dhuria on 3/19/24.
//

import SwiftUI

struct HomeSearchBar: View {
    let btnAction: () = ()
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .fill(.gray)
            .overlay {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .frame(width: 60, height: 60)
                    VStack(alignment: .leading, content: {
                        Text("Search...")
                            .foregroundStyle(.primary)
                            .multilineTextAlignment(.leading)
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("Property for sale")
                            .font(.caption)
                            .foregroundStyle(.blue)
                    })
                    Spacer()
                    Button {
                        btnAction
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .foregroundStyle(.black)
                            .padding()
                    }
                }
                .padding()
            }
            .frame(height: 80)
    }
}

#Preview {
    HomeSearchBar()
}
