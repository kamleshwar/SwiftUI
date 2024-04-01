//
//  ToggleButton.swift
//  SwiftUIComponents
//
//  Created by Kamleshwar Dhuria on 4/1/24.
//

import SwiftUI

struct ToggleButton: View {
    @State private var isWifiOn = false
    var body: some View {
        VStack {
            Form { // if using Form - use Toggle
                Toggle("Wi-Fi", isOn: $isWifiOn)
                    .tint(.orange)
                // With System Image
                Toggle("Wi-Fi", systemImage: getWifiImage(), isOn: $isWifiOn)
                // Change color with Tint
                Toggle("Wi-Fi", systemImage: getWifiImage(), isOn: $isWifiOn)
                    .tint(.red)
                    .contentTransition(.symbolEffect)
            }
            
            // Button Style
            ScrollView {
                Toggle("Wi-Fi", systemImage: getWifiImage(), isOn: $isWifiOn)
                    .tint(.orange)
                    .toggleStyle(.button)
                    .contentTransition(.symbolEffect)
                
                Toggle("Wi-Fi", systemImage: getWifiImage(), isOn: $isWifiOn)
                    .font(.largeTitle) // To make Icon size bigger
                    .tint(.orange)
                    .toggleStyle(.button)
                    .labelStyle(.iconOnly)
                    .contentTransition(.opacity)
            }
        }
        .padding()
        
    }
    
    func getWifiImage() -> String {
        return isWifiOn ? "wifi" : "wifi.slash"
    }
}

#Preview {
    ToggleButton()
}
