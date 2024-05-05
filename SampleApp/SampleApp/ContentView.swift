//
//  ContentView.swift
//  SampleApp
//
//  Created by Kamleshwar Dhuria on 4/4/24.
//

/*
 Square in center of screen
 
 edges 200 pt
 
 */

import SwiftUI

struct ContentView: View {
    let arr = ["1","2","3"] //
    let arr1 = ["A","B","C"] //
    
    // Chain method
    
    var body: some View {
        VStack {
            List {
                ForEach(arr, id: \.self) { item in
                    Text(item)
                }
                
                ForEach(arr1, id: \.self) { item in
                    Text(item)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
