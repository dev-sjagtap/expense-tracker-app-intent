//
//  AddExpenseIntent.swift
//  AddExpenseIntent
//
//  Created by Sushant V. Jagtap on 01/03/25.
//

import AppIntents
import CoreData

struct AddExpenseIntent: AppIntent {
    
    static var title: LocalizedStringResource = "Add Expense"
    static var description = IntentDescription("Adds an expense to your records")
    
    @Parameter(title: "Amount")
    var amount: Double
    
    @Parameter(title: "Description", description: "General Expense")
    var description: String
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        
        let newExpense = Expense(context: PersistenceStorage.shared.context)
        newExpense.amount = amount
        newExpense.category = "Entertainment"
        newExpense.expenseDescription = description
        newExpense.date = Date()
        
        print("Intent Called")
        PersistenceStorage.shared.saveContext()
        let formattedAmount = formatCurrency(amount: amount)
        return .result(dialog: "Expense of \(formattedAmount) added to \(description).") // Return a confirmation message.
        //        return .result()
    }
    
    
    private func formatCurrency(amount: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_IN") // Indian locale
        return formatter.string(from: NSNumber(value: amount)) ?? "₹\(amount)"
    }
}
