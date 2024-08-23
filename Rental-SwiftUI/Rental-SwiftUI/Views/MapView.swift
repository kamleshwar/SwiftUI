//
//  MapView.swift
//  Rental-SwiftUI
//
//  Created by Kamleshwar Dhuria on 3/19/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    let houseList = houseCards
    var body: some View {
        NavigationStack {
            Map{
                ForEach(houseList) { list in
                    Annotation("House", coordinate:  CLLocationCoordinate2D(latitude: list.long, longitude: list.lat)) {
                        ZStack(content: {
                            RoundedRectangle(cornerRadius: 5).fill(.background)
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.secondary, lineWidth: 5)
                            Image(systemName: "house")
                                .padding(5)
                        })
                    }
                }.annotationTitles(.hidden)
            }
        }
    }
}

#Preview {
    MapView()
}
