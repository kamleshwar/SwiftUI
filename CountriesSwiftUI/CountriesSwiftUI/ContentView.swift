//
//  ContentView.swift
//  CountriesSwiftUI
//
//  Created by Kamleshwar Dhuria on 3/20/24.
//

import SwiftUI

extension URLCache {
    
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    //let columns: [GridItem] = [.init()]
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(viewModel.countryList ) { country in
                        VStack(alignment: .leading, 
                               content: {
                            HStack {
                                Text(country.name)
                                    .bold()
                                    .foregroundStyle(.brown)
                                Spacer()
                                Text(country.code)
                                    .bold()
                                    .foregroundStyle(.purple)
                            }
                            HStack {
                                Text(country.capital)
                                Spacer()
                                    AsyncImage(url: URL(string: "https://picsum.photos/id/237/50/50")!) { image in
                                        VStack {
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 50)
                                                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                        }
                                    } placeholder: {
                                        VStack {
                                            Image(systemName: "photo")
                                                .imageScale(.large)
                                                .frame(width: 50, height: 50)
                                        }
                                    }
                                   

                            }
                        })
                    }
                }
            }.onAppear(perform: {
                viewModel.fetchCountries()
            })
            .refreshable {
                viewModel.fetchCountries()
            }
        }
    }
}

#Preview {
    ContentView()
}
