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
        $0.font = UIFont.boldSystemFont(ofSize: 25)
    }
    var buyerNickName = UILabel().then {
        $0.textAlignment = .left
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .placeholderText
    }
    var buyerImage = UIImageView().then {
        $0.layer.cornerRadius = 30
        $0.contentMode = .scaleToFill
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        setUp()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setUp(){
        self.selectionStyle = .blue
        
        [buyingListTitle,buyerNickName,buyerImage].forEach{self.addSubview($0)}
        buyerImage.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(30)
            $0.height.equalTo(200)
            $0.top.equalTo(buyerNickName.snp.bottom)
        }
        buyingListTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview().inset(30)
        }
        buyerNickName.snp.makeConstraints {
            $0.top.equalTo(buyingListTitle.snp.bottom)
            $0.left.right.equalToSuperview().inset(30)
        }
    }
}
