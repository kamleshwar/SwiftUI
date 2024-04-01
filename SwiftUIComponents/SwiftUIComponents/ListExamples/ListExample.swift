//
//  ListExample.swift
//  SwiftUIComponents
//
//  Created by Kamleshwar Dhuria on 4/1/24.
//

import SwiftUI

struct ListExample: View {
    @State private var cars = DummyData.cars
    
    var body: some View {
        NavigationStack {
            List(cars, id: \.id) { car in
                HStack {
                    Text(car.name)
                    Spacer()
                    Text(car.daily, format: .currency(code: "USD"))
                        .padding(.trailing, 15)
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(.mint)
                        .opacity(car.isAvailalbe ? 1.0 : 0.0)
                }
            }
            .navigationTitle("Cars")
            .toolbar {
                Button("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                    //cars = cars.filter { $0.isAvailalbe }
                    //or
                    cars = cars.filter(\.isAvailalbe)
                }
                .tint(.blue)
            }
        }
    }
}

#Preview {
    ListExample()
}


// Cars model

struct Car {
    var id = UUID()
    var name: String
    var daily: Int
    var isAvailalbe: Bool
}

struct DummyData {
    static let cars: [Car] = [
        .init(name: "Ford 150", daily: 100, isAvailalbe: true),
        .init(name: "Ford Fusion", daily: 40, isAvailalbe: false),
        .init(name: "Honda Accord", daily: 40, isAvailalbe: true)
        
    ]
}
