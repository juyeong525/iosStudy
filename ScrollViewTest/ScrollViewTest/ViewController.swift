//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by 박주영 on 2022/07/13.
//

import UIKit
import SnapKit
import Then
class ViewController: UIViewController {

    var scrollView = ScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
