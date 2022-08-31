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
    var infoMyListLabel = UILabel().then {
        $0.text = "내목록"
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    var myListTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myListTableView.delegate = self
        myListTableView.dataSource = self
        myListTableView.register(MYListTableViewCell.self, forCellReuseIdentifier: "MyListTableViewCell")
        myListTableView.rowHeight = 50
        targets()
        self.navigationController?.navigationBar.topItem?.title = "MY"
        
    }
    
    override func viewWillLayoutSubviews() {
        addSubviews()
        makeSubviewConstraints()
    }
    
    @objc func onLoginButton(_ sender: UIButton){
        print("클릭됨")
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func targets() {
    }
    
    func addSubviews() {
        [myNameLabel, infoMyListLabel, myListTableView]
            .forEach { view.addSubview($0) }
    }
    
    func makeSubviewConstraints() {
        myNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
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
    }
    
}
extension MyProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyListTableViewCell", for: indexPath) as! MYListTableViewCell
        cell.myListTitle.text = "fsfasdfasfsaD"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let vc = ListDetailViewController()
       self.navigationController?.pushViewController(vc, animated: true)

   }
}

