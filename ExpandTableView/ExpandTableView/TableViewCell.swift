//
//  TableViewCell.swift
//  ExpandTableView
//
//  Created by Subhajit Biswas on 28/05/24.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let idemtifier = "TableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "TableViewCell", bundle: nil)
    }
    
    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var cellImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
