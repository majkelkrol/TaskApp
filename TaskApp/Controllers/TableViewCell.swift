//
//  TableViewCell.swift
//  TaskApp
//
//  Created by Majkel on 08/01/2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskImage: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    
    
    var status = false
    static let cellId = "cell"
    static let height: CGFloat = 65
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
