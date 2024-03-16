//
//  CheckoutView.swift
//  MyDash
//
//  Created by Kamleshwar Dhuria on 3/16/24.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    @State private var paymentType = "Cash"
    let paymentTypes = ["Cash", "Credit Card", "Ponts", "Apple Pay"]
    
    @State private var addLDetails = false
    @State private var lNumber = ""
    
    let tipAmounts = [10, 15,20,25,0]
    @State private var tipAmount = 15
    
    var totalprice: String {
        let total = Double(order.total)
        let tip = ((total / 100) * Double(tipAmount))
        return (total + tip).formatted(.currency(code: "USD"))
    }
    
    @State private var displayPaymentAlert = false

    
    var body: some View {
        Form {
            Section {
                Picker("How d you want to pay?", selection: $paymentType) {
                    ForEach(paymentTypes, id: \.self) {
                        Text($0)
                    }
                }
            }
            Toggle("Add your loyalty card", isOn: $addLDetails.animation())
            if addLDetails {
                TextField("Enter your card details", text: $lNumber)
                    .keyboardType(.decimalPad)
            }
            
            Section("Add tip?") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            Section("Total = \(totalprice)") {
                Button("Confirm Order") {
                    // call API
                    displayPaymentAlert.toggle()
                }
            }
        }
        .navigationTitle("Make Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed", isPresented: $displayPaymentAlert) {
            
        } message: {
            Text("Your total was \(totalprice) - thank you")
        }
    }
    
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
