//
//  MyViewController.swift
//  DSMTogtherBuying
//
//  Created by 박주영 on 2022/07/04.
//


import UIKit
import SnapKit
import Then
import Alamofire
class MyProfileViewController: UIViewController{
    
    var myNameLabel = UILabel().then {
        $0.textAlignment = .center
        $0.text = "박주영"
    }
    var myImage = UIImageView().then {
        $0.image = UIImage.add
    }
    var infoMyListLabel = UILabel().then {
        $0.text = "내목록"
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    var myListTableView = UITableView()
    
    lazy var loginButton = UIButton(type: .system).then {
        $0.backgroundColor = .systemMint
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 15
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myListTableView.delegate = self
        myListTableView.dataSource = self
        myListTableView.register(BuyingListTableViewCell.self, forCellReuseIdentifier: "buyingListTableViewCell")
        loginButton.addTarget(self, action: #selector(onLoginButton), for: .touchUpInside)
        self.navigationController?.navigationBar.topItem?.title = "MY"
    }
    
    override func viewWillLayoutSubviews() {
        setUp()
    }
    
    @objc func onLoginButton(_ sender: UIButton){
        print("클릭됨")
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func setUp(){
        [myNameLabel, myImage, infoMyListLabel, myListTableView, loginButton]
            .forEach { view.addSubview($0) }
        myImage.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.leading.trailing.equalToSuperview().inset(150)
            $0.height.equalTo(100)
        }
        myNameLabel.snp.makeConstraints {
            $0.top.equalTo(myImage.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        infoMyListLabel.snp.makeConstraints {
            $0.top.equalTo(myNameLabel.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(16)
        }
        myListTableView.snp.makeConstraints {
            $0.top.equalTo(infoMyListLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(70)
            $0.height.equalTo(40)
        }
    }
    
}
extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buyingListTableViewCell", for: indexPath) as! BuyingListTableViewCell
        cell.buyingListTitle.text = "1"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let vc = ListDetailViewController()
       self.navigationController?.pushViewController(vc, animated: true)

   }
}
