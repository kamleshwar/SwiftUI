//
//  AnimationExample.swift
//  SwiftUIComponents
//
//  Created by Kamleshwar Dhuria on 5/5/24.
//

import SwiftUI

struct BGColorExample: View {
    @State var colors: [Color] = [Color.red, Color.green, Color.purple]
    var body: some View {
        ZStack {
            // BG Coloe with gradient colors
            LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
            Image(systemName: "heart")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .frame(width: 250)
                .blendMode(.destinationOut)
            
            VStack {
                Button("Tap to change BG Color") {
                    colors = [Color.red, Color.green, Color.purple, .blue]
                    
                    colors.remove(at: Int.random(in: 0..<3))
                    colors.remove(at: Int.random(in: 0..<2))
                }.foregroundColor(.black)
            }
            
        }.compositingGroup()
            .shadow(
                color: .gray,
                radius: 5,
                x: -15,
                y: 10)
    }
}

#Preview {
    BGColorExample()
}
