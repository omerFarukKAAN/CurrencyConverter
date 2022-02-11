//
//  CurrencyVC.swift
//  CurrencyConverter
//
//  Created by Omer Kaan on 11.02.2022.
//

import UIKit

class CurrencyVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var curLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var allCurrencies = Dictionary<String, Any>()
    var currencyName = String()
    var currencyAmount = Double()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        curLabel.text = currencyName
        currencyAmount = allCurrencies[currencyName] as! Double
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as! TableViewCell
        let keys = Array(allCurrencies.keys).sorted()
        let currentKey = keys[indexPath.row]

        cell.currencyLabel?.text = currentKey
        
        if let amount = allCurrencies[currentKey] as? Double {
            let calculatedCurrency = currencyAmount / amount
            cell.amountLabel?.text = String(NSString(format:"%.4f", calculatedCurrency))
        }
        // Configure the cell...

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCurrencies.count
    }
}
