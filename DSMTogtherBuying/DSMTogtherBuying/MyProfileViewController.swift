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
class MyProfileViewController: UIViewController, UIPopoverPresentationControllerDelegate{
    let imagePickController = UIImagePickerController()
    var myNameLabel = UILabel().then {
        $0.textAlignment = .center
        $0.text = "박주영"
    }
    var myImageButton = UIButton().then {
        $0.setImage(UIImage.add, for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 50
        $0.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration.init(pointSize: 150), forImageIn: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleToFill
    }
    var infoMyListLabel = UILabel().then {
        $0.text = "내목록"
        $0.textAlignment = .left
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    var myListTableView = UITableView()
    
    lazy var loginButton = UIButton(type: .system).then {
        $0.backgroundColor = .black
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 15
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myListTableView.delegate = self
        myListTableView.dataSource = self
        myListTableView.register(MYListTableViewCell.self, forCellReuseIdentifier: "MyListTableViewCell")
        myListTableView.rowHeight = 50
        targets()
        self.navigationController?.navigationBar.topItem?.title = "MY"
        imagePickController.delegate = self
        
    }
    
    override func viewWillLayoutSubviews() {
        setUp()
    }
    
    @objc func onLoginButton(_ sender: UIButton){
        print("클릭됨")
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    @objc func touchImage(){
        imagePickController.sourceType = .photoLibrary
        imagePickController.delegate = self
        present(imagePickController, animated: true, completion: nil)
       
    }
    func targets() {
        loginButton.addTarget(self, action: #selector(onLoginButton), for: .touchUpInside)
        myImageButton.addTarget(self, action: #selector(touchImage), for: .touchUpInside)
    }
    func setUp(){
        [myNameLabel, myImageButton, infoMyListLabel, myListTableView, loginButton]
            .forEach { view.addSubview($0) }
        myImageButton.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(100)
        }
        myNameLabel.snp.makeConstraints {
            $0.top.equalTo(myImageButton.snp.bottom)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyListTableViewCell", for: indexPath) as! MYListTableViewCell
        cell.myListTitle.text = "fsfasdfasfsaD"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let vc = ListDetailViewController()
       self.navigationController?.pushViewController(vc, animated: true)

   }
}
extension MyProfileViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            myImageButton.setImage(image, for: .normal)
            
        }
        dismiss(animated: true,completion: nil)
    }
}
