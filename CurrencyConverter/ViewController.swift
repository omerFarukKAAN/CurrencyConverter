//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Omer Kaan on 8.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func getButtonClicked(_ sender: Any) {
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
                                if let TRY = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: \(TRY)"
                                }
                                if let USD = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(USD)"
                                }
                                if let JPY = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: \(JPY)"
                                }
                                if let GBP = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(GBP)"
                                }
                                if let CHF = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(CHF)"
                                }
                                if let CAD = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(CAD)"
                                }
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
}

