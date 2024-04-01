//
//  ListHomeScreen.swift
//  SwiftUIComponents
//
//  Created by Kamleshwar Dhuria on 4/1/24.
//

import SwiftUI

struct ListHomeScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    NavigationLink {
                        ListExample()
                    } label: {
                        Text("Simple List")
                    }
                    
                    NavigationLink {
                        ListExample1()
                    } label: {
                        Text("Group By")
                    }
                }
            }
            .navigationTitle("List Examples")
        }
    }
}

#Preview {
    ListHomeScreen()
}
