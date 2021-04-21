//
//  ExtendedCell.swift
//  ExtendedTableView
//
//  Created by Angelos Staboulis on 20/4/21.
//

import UIKit

class ExtendedCell: UITableViewCell {
    @IBOutlet var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        accessoryType = .none
        backgroundColor = .none
    }
}
