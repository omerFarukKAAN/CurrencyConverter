//
//  TableViewCell.swift
//  CurrencyConverter
//
//  Created by Omer Kaan on 9.02.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var amoLabel: UILabel!
    @IBOutlet weak var curLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
