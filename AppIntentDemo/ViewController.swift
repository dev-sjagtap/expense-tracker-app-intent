//
//  ViewController.swift
//  AppIntentDemo
//
//  Created by Sushant V. Jagtap on 01/03/25.
//

import UIKit

class ViewController: UIViewController {
  
    // MARK: - Outlet
    @IBOutlet weak var expenseTableView: UITableView!
    
    // MARK: - Properties
    var expenses: [Expense] = []
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Expense Tracker"
        let refreshButton = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(refreshData))
        navigationItem.rightBarButtonItem = refreshButton
        setupTableView()
        
        
        // Sirikit Intent defination file
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchExpense()
        expenseTableView.reloadData()
    }
    
    // MARK: - setup methods
    func setupTableView() {
        expenseTableView.delegate = self
        expenseTableView.dataSource = self
        expenseTableView.register(UINib(nibName: "ExpenseTableViewCell", bundle: nil), forCellReuseIdentifier: "ExpenseTableViewCell")
    }
    
    func fetchExpense() {
        expenses.removeAll()
        let path = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        debugPrint(path[0])
        
        do {
            guard let result = try PersistenceStorage.shared.context.fetch(Expense.fetchRequest()) as? [Expense] else { return }
            expenses = result
        } catch let error {
            debugPrint(error)
        }
    }
    
    @objc func refreshData() {
        fetchExpense()
        expenseTableView.reloadData()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expenseTableView.dequeueReusableCell(withIdentifier: "ExpenseTableViewCell", for: indexPath) as! ExpenseTableViewCell
        cell.setExpenseDetails(details: expenses[indexPath.row])
        return cell
    }
}
