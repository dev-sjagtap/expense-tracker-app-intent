//
//  Expense+CoreDataProperties.swift
//  AppIntentDemo
//
//  Created by Sushant V. Jagtap on 03/03/25.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var amount: Double
    @NSManaged public var category: String?
    @NSManaged public var expenseDescription: String?
    @NSManaged public var date: Date?

}

extension Expense : Identifiable {

}
