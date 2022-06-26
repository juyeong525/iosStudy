//
//  ViewController.swift
//  SnapKitStudy
//
//  Created by 박주영 on 2022/06/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    var redView = UIView()
    var orangeView = UIView()
    var blueView = UIView()
    var greenView = UIView()
    var indigoView = UIView()
    var purpleView = UIView()
    var yellowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(redView)
        self.view.addSubview(orangeView)
        self.view.addSubview(yellowView)
        self.view.addSubview(greenView)
        self.view.addSubview(blueView)
        self.view.addSubview(indigoView)
        self.view.addSubview(purpleView)
        redView.backgroundColor = .red
        orangeView.backgroundColor = .orange
        blueView.backgroundColor = .blue
        greenView.backgroundColor = .green
        indigoView.backgroundColor = .systemIndigo
        purpleView.backgroundColor = .purple
        yellowView.backgroundColor = .yellow
        // Do any additional setup after loading the view.
        redView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.size.width.height.equalTo(100)
            make.left.equalTo(view.snp.left)
        }
        orangeView.snp.makeConstraints { make in
            make.top.equalTo(redView.snp.bottom)
            make.size.width.height.equalTo(100)
            make.left.equalTo(redView.snp.left)
        }
        yellowView.snp.makeConstraints { make in
            make.top.equalTo(orangeView.snp.bottom)
            make.size.width.height.equalTo(100)
            make.left.equalTo(orangeView.snp.left)
        }
        greenView.snp.makeConstraints { make in
            make.top.equalTo(yellowView.snp.top)
            make.size.width.height.equalTo(100)
            make.left.equalTo(yellowView.snp.right)
        }
        blueView.snp.makeConstraints { make in
            make.top.equalTo(greenView.snp.bottom)
            make.size.width.height.equalTo(100)
            make.left.equalTo(greenView.snp.left)
        }
        indigoView.snp.makeConstraints { make in
            make.top.equalTo(blueView.snp.bottom)
            make.size.width.height.equalTo(100)
            make.left.equalTo(blueView.snp.left)
        }
        purpleView.snp.makeConstraints { make in
            make.top.equalTo(indigoView.snp.bottom)
            make.size.width.height.equalTo(100)
            make.left.equalTo(indigoView.snp.left)
        }

    }


}

