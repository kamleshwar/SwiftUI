//
//  ScrollViewExample1.swift
//  SwiftUIComponents
//
//  Created by Kamleshwar Dhuria on 4/1/24.
//

import SwiftUI

struct ScrollViewExample1: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(MockViewsData.dummy, id: \.id) { item in
                    Rectangle()
                        //.frame(width: 380, height: 600) // For static frame
                    
                        // instead of frame use Container and set number of item need to diaplay on screen = count: 1 or 2
                        .containerRelativeFrame(.horizontal, count: 1, spacing: 10)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .foregroundStyle(item.color.gradient)
                        .scrollTransition { content, phase in
                            content.opacity(phase.isIdentity ? 1.0 : 0.4)
                            // On Scroll you will notice it fadding animation
                                .scaleEffect(x: phase.isIdentity ? 1.0 : 0.5,
                                             y: phase.isIdentity ? 1.0 : 0.5
                                )
                            // Display Scale on scroll
                        }
                    
                }
            }.scrollTargetLayout()
        }.contentMargins(15, for: .scrollContent) // Add this to display next View to inform user there is something to scroll
            .scrollTargetBehavior(.paging) // Scroll as Page 1 at a time
    }
}

#Preview {
    ScrollViewExample1()
}

struct ViewItems {
    let id = UUID()
    let color: Color
}

struct MockViewsData {
    static let dummy: [ViewItems] = [
        .init(color: .red),
        .init(color: .purple),
        .init(color: .green),
        .init(color: .blue),
        .init(color: .gray),
        .init(color: .cyan),
        .init(color: .orange),
        .init(color: .red),
        .init(color: .purple),
        .init(color: .green),
        .init(color: .blue),
        .init(color: .gray),
        .init(color: .cyan),
    ]
}
