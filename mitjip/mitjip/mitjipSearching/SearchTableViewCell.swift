//
//  SearchTableViewCell.swift
//  mitjip
//
//  Created by 박주영 on 2022/06/09.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var foodTitle: UILabel!
    
    override func awakeFromNib() {
        foodTitle.sizeToFit()

        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
