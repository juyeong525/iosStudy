//
//  buyingListTableViewCell.swift
//  DSMTogtherBuying
//
//  Created by 박주영 on 2022/07/04.
//

import UIKit
import SnapKit
import Then
class BuyingListTableViewCell: UITableViewCell,UITableViewDelegate {

    var buyingListTitle = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    var buyerNickName = UILabel().then {
        $0.textAlignment = .left
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .placeholderText
    }
    var backView = UIView().then {
        $0.backgroundColor = .white
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        setUp()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setUp(){
        self.backgroundColor = UIColor(named: "Color")
        self.addSubview(backView)
        backView.layer.cornerRadius = 20
        self.selectionStyle = .none
        backView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(5)
            $0.left.right.equalToSuperview().inset(20)
        }
        [buyingListTitle,buyerNickName].forEach{backView.addSubview($0)}
        buyingListTitle.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.left.equalToSuperview().inset(20)
        }
        buyerNickName.snp.makeConstraints {
            $0.top.equalTo(buyingListTitle.snp.bottom)
            $0.left.right.equalToSuperview().inset(20)
        }
    }
}
