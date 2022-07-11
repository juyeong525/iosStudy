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
class MyViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        myListTableView.delegate = self
        myListTableView.dataSource = self
        myListTableView.register(BuyingListTableViewCell.self, forCellReuseIdentifier: "buyingListTableViewCell")
    }
    override func viewWillLayoutSubviews() {
        setUp()
    }
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
    var loginButton = UIButton().then {
        $0.backgroundColor = .systemMint
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.addTarget($0, action: #selector(onLoginButton), for: .touchUpInside)
    }
    @objc func onLoginButton(){
        print("클릭됨")
    }
    func setUp(){
        view.addSubview(myNameLabel)
        view.addSubview(myImage)
        view.addSubview(infoMyListLabel)
        view.addSubview(myListTableView)
        view.addSubview(loginButton)
        myImage.snp.makeConstraints {
            $0.top.equalTo(100)
            $0.right.equalToSuperview().inset(150)
            $0.left.equalToSuperview().inset(150)
            $0.bottom.equalToSuperview().inset(700)
        }
        myNameLabel.snp.makeConstraints {
            $0.top.equalTo(myImage.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(650)
        }
        infoMyListLabel.snp.makeConstraints {
            $0.top.equalTo(myNameLabel.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview().inset(350)
            $0.bottom.equalToSuperview().inset(600)
        }
        myListTableView.snp.makeConstraints {
            $0.top.equalTo(infoMyListLabel.snp.bottom)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(200)
        }
        loginButton.snp.makeConstraints {
            $0.left.equalToSuperview().inset(300)
            $0.right.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(50)
            $0.bottom.equalTo(myImage.snp.top)
        }
    }
    
}
extension MyViewController: UITableViewDelegate, UITableViewDataSource {
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
