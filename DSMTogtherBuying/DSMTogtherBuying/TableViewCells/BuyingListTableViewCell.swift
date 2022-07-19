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
    var buyingListRemainCount = UILabel().then {
        $0.textColor = .red
        $0.textAlignment = .left
    }
    var buyingListAllCount = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
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
        [buyingListTitle,buyingListAllCount,buyingListRemainCount].forEach{self.addSubview($0)}
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.black.cgColor
        buyingListTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview()
            $0.height.equalTo(33)
        }
        buyingListAllCount.snp.makeConstraints {
            $0.top.equalTo(buyingListTitle.snp.bottom)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview()
            $0.height.equalTo(33)
        }
        buyingListRemainCount.snp.makeConstraints {
            $0.top.equalTo(buyingListAllCount.snp.bottom)
            $0.left.equalToSuperview().offset(30)
            $0.right.equalToSuperview()
            $0.height.equalTo(33)
        }
        
    }

}
