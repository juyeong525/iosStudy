//
//  ViewController.swift
//  ScrollViewTest
//
//  Created by 박주영 on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {

    let scrollView = ScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        view.addSubview(scrollView)
    }
}
