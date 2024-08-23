//
//  ContentView.swift
//  AsyncAwaitPractice
//
//  Created by Kamleshwar Dhuria on 3/19/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }.onAppear {
            Task {
                try? await printUsers()
            }
            
        }
        .padding()
    }
    
    func printUsers() async throws {
        let url = URL(string: "https://hws.dev/users.csv")!

        var iterator = url.lines.makeAsyncIterator()

        if let line = try await iterator.next() {
            print("The first user is \(line)")
        }

        for i in 2...5 {
            if let line = try await iterator.next() {
                print("User #\(i): \(line)")
            }
        }

        var remainingResults = [String]()

        while let result = try await iterator.next() {
            remainingResults.append(result)
        }

        print("There were \(remainingResults.count) other users.")
    }
    
}

#Preview {
    ContentView()
}
