//
//  ListViewTableViewCell.swift
//  ModelViewViewModelApp
//
//  Created by Phincon on 13/03/23.
//

import UIKit

class ListViewTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
