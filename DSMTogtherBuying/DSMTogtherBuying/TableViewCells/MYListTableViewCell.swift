//
//  MYListTableViewCell.swift
//  DSMTogtherBuying
//
//  Created by 박주영 on 2022/07/19.
//

import UIKit
import Then
import SnapKit
class MYListTableViewCell: UITableViewCell {
    var myListTitle = UILabel().then {
        $0.textAlignment = .left
    }
    var blackLine = UIView().then {
        $0.backgroundColor = .black
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        setUp()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func setUp(){
        [myListTitle,blackLine].forEach{self.addSubview($0)}
        myListTitle.snp.makeConstraints {
            $0.left.equalToSuperview().inset(15)
            $0.right.top.bottom.equalToSuperview()
        }
        blackLine.snp.makeConstraints {
            $0.top.equalTo(myListTitle.snp.bottom)
            $0.left.right.equalToSuperview().inset(15)
            $0.height.equalTo(1)
        }
    }

}
