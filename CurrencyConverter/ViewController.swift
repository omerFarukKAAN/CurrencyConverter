//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Omer Kaan on 8.02.2022.
//

import UIKit
import iOSDropDown

class ViewController: UIViewController {

    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var secondDropDown: DropDown!
    @IBOutlet weak var dropDown: DropDown!
    
    var currency = ""
    var convertedCurrency = ""
    var currencies = Dictionary<String, Any>()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCurrencies()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapRecognizer)
        
        navigationItem.title = "Currency Converter"

        dropDown.didSelect { selectedText, index, id in
            self.currency = selectedText
        }
        secondDropDown.didSelect { selectedText, index, id in
            self.convertedCurrency = selectedText
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func convertClicked(_ sender: Any) {
        if let cur1 = currencies[currency] as? Double {
            if let cur2 = currencies[convertedCurrency] as? Double {
                if let amount = Double(amount.text!) {
                    let result : Double = (amount * cur2) / cur1
                    self.result.text = String(result)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCurrenciesVC" {
            let destinationVC = segue.destination as! CurrenciesVC
            destinationVC.allCurrencies = currencies
        }
    }
    
    func getCurrencies() {
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=6bfcb3fcfc09d12a384941990fb6b8c0&format=1")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any] {
                                //Dropdown options
                                self.dropDown.optionArray = Array(rates.keys)
                                self.secondDropDown.optionArray = Array(rates.keys)
                                self.currencies = rates
                            }
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }
        task.resume()
    }
    
    @IBAction func getButtonClicked(_ sender: Any) {
//        let url = URL(string: "http://data.fixer.io/api/latest?access_key=6bfcb3fcfc09d12a384941990fb6b8c0&format=1")
//        let session = URLSession.shared
//        let task = session.dataTask(with: url!) { data, response, error in
//            if error != nil {
//                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
//                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
//                alert.addAction(okButton)
//                self.present(alert, animated: true, completion: nil)
//            } else {
//                if data != nil {
//                    do {
//                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
//
//                        DispatchQueue.main.async {
//                            if let rates = jsonResponse["rates"] as? [String : Any] {
//                                if let TRY = rates["TRY"] as? Double {
//                                    self.tryLabel.text = "TRY: \(TRY)"
//                                }
//                                if let USD = rates["USD"] as? Double {
//                                    self.usdLabel.text = "USD: \(USD)"
//                                }
//                                if let JPY = rates["JPY"] as? Double {
//                                    self.jpyLabel.text = "JPY: \(JPY)"
//                                }
//                                if let GBP = rates["GBP"] as? Double {
//                                    self.gbpLabel.text = "GBP: \(GBP)"
//                                }
//                                if let CHF = rates["CHF"] as? Double {
//                                    self.chfLabel.text = "CHF: \(CHF)"
//                                }
//                                if let CAD = rates["CAD"] as? Double {
//                                    self.cadLabel.text = "CAD: \(CAD)"
//                                }
//                            }
//
//                        }
//                    } catch {
//                        print("error")
//                    }
//                }
//            }
//        }
//        task.resume()
    }
}

