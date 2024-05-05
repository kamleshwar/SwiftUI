//
//  MenuItemViewExample.swift
//  SwiftUIComponents
//
//  Created by Kamleshwar Dhuria on 5/4/24.
//

import SwiftUI

struct MenuItemViewExample: View {
    var body: some View {
        Menu {
            Section {
                    Button {} label: {
                Label("Edit", systemImage: "pencil")
                }
                    Button {} label: {
                Label("Share", systemImage: "square.and.arrow.up")
                }
            }
            Section {
                Button(role: .destructive, action: {}) {
                    Label("Delete", systemImage: "trash")
                }
            }
            
        } label: {
            Label("More", systemImage: "ellipsis.circle")
        }
        .menuOrder(.fixed)
    }
}

#Preview {
    MenuItemViewExample()
}
