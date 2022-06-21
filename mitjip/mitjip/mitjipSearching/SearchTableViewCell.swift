//
//  SearchTableViewCell.swift
//  mitjip
//
//  Created by 박주영 on 2022/06/09.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    @IBOutlet weak var foodTitle: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
//    @IBOutlet weak var foodImageView : UIImageView!
    
    override func awakeFromNib() {
        foodImageView.layer.cornerRadius = foodImageView.frame.width/8
        foodImageView.clipsToBounds = true
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
