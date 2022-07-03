//
//  ViewController.swift
//  SnapKitStudy
//
//  Created by 박주영 on 2022/06/23.
//

import UIKit
import SnapKit
import Then


class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    let label = UILabel().then{
        $0.text = "center"
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        $0.textAlignment = .center
        $0.textColor = .red
    }
    func setUpView(){
        self.view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalTo(view.snp.center)
        }
    }

}
