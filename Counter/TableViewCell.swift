//
//  TableViewCell.swift
//  Counter
//
//  Created by Aleksandr Velikanov on 30.09.2022.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var counterNameLabel: UILabel!
    @IBOutlet weak var counterCountLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
