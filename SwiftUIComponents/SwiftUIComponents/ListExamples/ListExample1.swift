//
//  ListExample1.swift
//  SwiftUIComponents
//
//  Created by Kamleshwar Dhuria on 4/1/24.
//

import SwiftUI
import Foundation
import Algorithms

struct ListExample1: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(MockData.expenses) { exp in
                    HStack {
                        Text(exp.date.formatted(date: .numeric, time: .omitted))
                            .font(.footnote)
                            .frame(width: 80, alignment: .leading)
                        Text(exp.title)
                        Spacer()
                        Text(exp.value, format: .currency(code: "USD"))
                    }
                }
            }
            
            Text("Group By: Months")
                .bold()
                .padding(10)
            // Grouped by Months using Apple algorithm Chunk by
            List {
                ForEach(MockData.groupByMonths, id: \.self) { expenses in
                    DisclosureGroup {
                        ForEach(expenses) { expense in
                            HStack {
                                Text(expense.date.formatted(date: .numeric, time: .omitted))
                                    .font(.footnote)
                                    .frame(width: 80, alignment: .leading)
                                Text(expense.title)
                                Spacer()
                                Text(expense.value, format: .currency(code: "USD"))
                            }
                        }
                    } label: {
                        Text(expenses.first!.date.formatted(.dateTime.month(.wide)))
                    }
                }
            }
        }
    }
}

#Preview {
    ListExample1()
}

struct Expense: Hashable, Identifiable {
    let id = UUID()
    let date: Date
    let title: String
    let value: Double
}

struct MockData {
    static let calander = Calendar.current
    // Random
    static var expenses:[Expense] = [
        .init(date: .now, title: "Buy iPhone", value: 1000),
        .init(date: .now, title: "Buy iPad", value: 400),
        .init(date: .now, title: "Gas", value: 45),
        .init(date: calander.date(byAdding: .day, value: 50, to: .now)!, title: "Exp 1", value: 90),
        .init(date: calander.date(byAdding: .day, value: 53, to: .now)!, title: "Exp 2", value: 12),
        .init(date: calander.date(byAdding: .day, value: 25, to: .now)!, title: "Exp 4", value: 45),
        .init(date: calander.date(byAdding: .day, value: 35, to: .now)!, title: "Exp 6", value: 66),
        .init(date: calander.date(byAdding: .day, value: 55, to: .now)!, title: "Exp 8", value: 123),
        .init(date: calander.date(byAdding: .day, value: 65, to: .now)!, title: "Exp 12", value: 554),
        .init(date: calander.date(byAdding: .day, value: 65, to: .now)!, title: "Exp 14", value: 23),
    ]
    
    static var groupByMonths: [[Expense]] {
        let grouped = MockData.expenses.chunked {
            calander.isDate($0.date, equalTo: $1.date, toGranularity: .month)
        }
        return grouped.map { Array($0) }
    }
}
