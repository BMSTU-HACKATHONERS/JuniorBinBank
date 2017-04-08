//
//  IncomeCell.swift
//  BinBank
//
//  Created by Алексаndr on 08.04.17.
//  Copyright © 2017 xxx. All rights reserved.
//

import UIKit

class IncomeCell: UITableViewCell {

    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
