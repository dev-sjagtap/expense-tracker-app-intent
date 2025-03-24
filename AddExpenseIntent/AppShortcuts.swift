//
//  AppShortcuts.swift
//  AddExpenseIntent
//
//  Created by Sushant V. Jagtap on 02/03/25.
//

import Foundation
import AppIntents

struct AppShortcuts: AppShortcutsProvider {
    
    static var appShortcuts: [AppShortcut] {
        
        AppShortcut(intent: AddExpenseIntent(), 
                    phrases: ["Add expense of \(\.$amount) to \(\.$description)",
                              "Record expense of \(\.$amount) for \(\.$description)",
                              "Log \(\.$amount) for \(\.$description) as expense",
                              "Hey Siri, please add expense of \(\.$amount) to \(\.$description)",
                              "Add expense of \(\.$amount) to \(.applicationName) for \(\.$description)",
                              "Log data to \(.applicationName) as expense"],
                    shortTitle: "Add Expense",
                    systemImageName: "arrow.up.circle.fill")
    }
    
}
