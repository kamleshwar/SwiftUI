//
//  AlertsExamplesView.swift
//  SwiftUIComponents
//
//  Created by Kamleshwar Dhuria on 5/6/24.
//

import SwiftUI

struct AlertsExamplesView: View {
    @State private var shouldDisplayAlert = false
    @State private var shouldDisplayEnterValueAlert = false
    @State private var shouldDisplayLoginAlert = false
    
    // To display different errors
    @State private var error: CustomErrors = .noNetwork
    
    // Value
    @State private var stringVal: String = ""
    var body: some View {
        VStack(alignment: .center, spacing: 40, content: {
            Button("Simple Alert") {
                shouldDisplayAlert = true
            }
            .alert("No Network", isPresented: $shouldDisplayAlert) {
                // Ok button is by default
                Button("Try Again", role: .destructive) {
                    // Action Here
                }
                Button("Cancel", role: .cancel) {
                    // No action
                }
            } message: {
                Text("No network detected. Connect to wi-fi or cellular and try again.")
            }
            
            Button("Enter Value Alert") {
                shouldDisplayEnterValueAlert = true
            }
            .alert("Enter value Alert!", isPresented: $shouldDisplayEnterValueAlert) {
                TextField("Enter your name", text: $stringVal)
                Button("Submit") {
                    // Action
                }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Enter your name.")
            }

            Text("Name: \(stringVal)")
            
            Button("Login Example") {
                shouldDisplayLoginAlert = true
                let temp: [CustomErrors] = [.noNetwork, .invalidInput, .serverNotAvailable]
                error = temp.randomElement() ?? .noNetwork
            }.alert(isPresented: $shouldDisplayLoginAlert,
                    error: error) { error in
                
            } message: { error in
                Text(error.failureReason!)
            }
        })
    }
}

#Preview {
    AlertsExamplesView()
}

enum CustomErrors: LocalizedError {
    case invalidInput
    case serverNotAvailable
    case noNetwork
    
    var errorDescription: String? {
        switch self {
        case .invalidInput:
            "Invalid Input"
        case .serverNotAvailable:
            "Invalid response"
        case .noNetwork:
            "No network connection"
        }
    }
    
    var failureReason: String? {
        switch self {
        case .invalidInput:
            "Username or Password is incorrect"
        case .serverNotAvailable:
            "Invalid response from server"
        case .noNetwork:
            "Unable to detect a network connectin. please connect to wi-fi or cellular and try agina."
        }
    }
}
