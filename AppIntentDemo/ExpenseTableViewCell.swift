//
//  ExpenseTableViewCell.swift
//  AppIntentDemo
//
//  Created by Sushant V. Jagtap on 06/03/25.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var categoryLable: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Public methods
    func setExpenseDetails(details: Expense) {
        descLabel.text = details.expenseDescription
        categoryLable.text = details.category
        amountLabel.text = String(details.amount)
    }
    
}
