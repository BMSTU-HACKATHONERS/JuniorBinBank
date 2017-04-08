//
//  BalanceViewController.swift
//  BinBank
//
//  Created by Алексаndr on 08.04.17.
//  Copyright © 2017 xxx. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

class BalanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var requestTextfiled: UITextField!
    
    @IBOutlet weak var incomeTableView: UITableView!
    @IBOutlet weak var expenceTableView: UITableView!
    
    @IBAction func request(_ sender: Any) {
        
        let money = Int(requestTextfiled.text!)
        let balance = Int(balanceLabel.text!)
        balanceLabel.text = String(money! + balance!)
        requestTextfiled.text = ""
    }
    
    var child = Child()
    
    var incomes: Array<Income> = []
    var expenses: Array<Expense> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        incomeTableView.dataSource = self
        incomeTableView.delegate = self
        
        expenceTableView.dataSource = self
        expenceTableView.delegate = self
        
        incomeTableView.tableFooterView = UIView()
        expenceTableView.tableFooterView = UIView()
        
        let child = DatabaseHelper.getChild()
        print(child.balance)
        balanceLabel.text = String(child.balance)
        
        let income1 = Income()
        income1.value = 200
        let income2 = Income()
        income2.value = 5000
        let income3 = Income()
        income3.value = 12000
        incomes.append(income1)
        incomes.append(income2)
        incomes.append(income3)
        
        let expense1 = Expense()
        expense1.value = 200
        let expense2 = Expense()
        expense2.value = 5000
        expense2.type = 1
        let expense3 = Expense()
        expense3.value = 12000
        expense3.type = 2
        let expense4 = Expense()
        expense4.value = 555
        expense4.type = 3
        let expense5 = Expense()
        expense5.value = 12000
        expense5.type = 4
        expenses.append(expense1)
        expenses.append(expense2)
        expenses.append(expense3)
        expenses.append(expense4)
        expenses.append(expense5)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        
        if tableView == incomeTableView{
            count = incomes.count
        }
        if tableView == expenceTableView{
            count = expenses.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.item
        
        if tableView == incomeTableView{
            let cell = incomeTableView.dequeueReusableCell(withIdentifier: "IncomeCell") as! IncomeCell
            cell.desc.text = incomes[index].getDescription()
            cell.value.text = String(incomes[index].value)
            return cell
        }
        else {
            let cell = expenceTableView.dequeueReusableCell(withIdentifier: "ExpenseCell") as! ExpenseCell
            cell.desc.text = expenses[index].getDescription()
            cell.value.text = String(expenses[index].value)
            return cell
        }
    }
    
}
