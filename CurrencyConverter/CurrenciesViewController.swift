//
//  CurrenciesViewController.swift
//  CurrencyConverter
//
//  Created by Omer Kaan on 10.02.2022.
//

import UIKit

class CurrenciesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allCurrencies = Dictionary<String, Any>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.delegate = self
        tableView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allCurrencies.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let keys = Array(allCurrencies.keys)
        let currentKey = keys[indexPath.row]
        
        cell.textLabel?.text = "omer"
        cell.currencyLabel?.text = "currentKey"
        
        if let amount = allCurrencies[currentKey] as? String {
            cell.amountLabel?.text = amount
        }
        // Configure the cell...

        return cell
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
