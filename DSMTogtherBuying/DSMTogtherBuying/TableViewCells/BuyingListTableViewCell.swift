//
//  buyingListTableViewCell.swift
//  DSMTogtherBuying
//
//  Created by 박주영 on 2022/07/04.
//

import UIKit
import SnapKit
import Then
class BuyingListTableViewCell: UITableViewCell {

    var buyingListTitle = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
    }
    var buyerNickName = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.boldSystemFont(ofSize: 15)
    }
    var buyerImage = UIImageView().then {
        $0.layer.cornerRadius = 30
    }
    
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
        
        [buyingListTitle,buyerNickName,buyerImage].forEach{self.addSubview($0)}
        buyerImage.snp.makeConstraints {
            $0.left.equalToSuperview().inset(15)
            $0.width.equalTo(57)
            $0.height.equalTo(60)
            $0.top.equalToSuperview().inset(10)
        }
        buyingListTitle.snp.makeConstraints {
            $0.top.equalTo(buyerNickName.snp.bottom)
            $0.left.equalTo(buyerImage.snp.right).offset(15)
            $0.right.equalToSuperview()
            $0.height.equalTo(40)
        }
        buyerNickName.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalTo(buyerImage.snp.right).offset(15)
            $0.right.equalToSuperview()
            $0.height.equalTo(40)
        }
        
    }
}
