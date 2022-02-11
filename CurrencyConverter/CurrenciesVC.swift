//
//  CurrenciesVC.swift
//  CurrencyConverter
//
//  Created by Omer Kaan on 9.02.2022.
//

import UIKit

class CurrenciesVC: UITableViewController {

    var allCurrencies = Dictionary<String, Any>()
    var keys = [String()]
    var selectedCurrencyName = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        keys = Array(allCurrencies.keys).sorted()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allCurrencies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "currenciesCell", for: indexPath) as! TableViewCell
        let currentKey = keys[indexPath.row]

        cell.currencyLabel?.text = currentKey
        
        if let amount = allCurrencies[currentKey] as? Double {
            cell.amountLabel?.text = String(NSString(format:"%.4f", amount))
        }
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCurrencyName = keys[indexPath.row]
        performSegue(withIdentifier: "toCurrencyVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCurrencyVC" {
            let destinationVC = segue.destination as! CurrencyVC
            destinationVC.allCurrencies = self.allCurrencies
            destinationVC.currencyName = self.selectedCurrencyName
        }
    }
}
