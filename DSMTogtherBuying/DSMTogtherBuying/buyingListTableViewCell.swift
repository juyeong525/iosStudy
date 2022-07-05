//
//  buyingListTableViewCell.swift
//  DSMTogtherBuying
//
//  Created by 박주영 on 2022/07/04.
//

import UIKit
import SnapKit
import Then
class buyingListTableViewCell: UITableViewCell {

    var buyingListTitle = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
    }
    var buyingImageView = UIImageView()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func layoutSubviews() {
        setUp()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func setUp(){
        self.addSubview(buyingListTitle)
        self.addSubview(buyingImageView)
        buyingImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().inset(50)
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview().inset(300)
        }
        buyingListTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(buyingImageView.snp.right)
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview()
        }
    }

}
