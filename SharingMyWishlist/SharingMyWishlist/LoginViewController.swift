//
//  LoginViewController.swift
//  SharingMyWishlist
//
//  Created by 박주영 on 2022/07/27.
//
import SnapKit
import UIKit
import Then
import Alamofire


class LoginViewController : UIViewController {
    let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "GRAM Logo-Bright 2")
        $0.contentMode = .scaleToFill
    }
    let idTextField = UITextField().then {
        $0.placeholder = "아이디를 입력하세요."
        $0.font = .systemFont(ofSize: 17)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.918, alpha: 1).cgColor
        $0.addLeftPadding()
        $0.layer.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1).cgColor
    }
    let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호를 입력하세요."
        $0.font = .systemFont(ofSize: 17)
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.918, alpha: 1).cgColor
        $0.addLeftPadding()
        $0.layer.backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1).cgColor
    }
    let loginButton = UIButton().then {
        $0.layer.cornerRadius = 12
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.918, alpha: 1).cgColor
        $0.layer.backgroundColor = UIColor(red: 0.937, green: 0.937, blue: 0.957, alpha: 1).cgColor
        $0.setTitle("Login", for: .normal)
        $0.setTitleColor(UIColor(red: 0, green: 0.478, blue: 1, alpha: 1), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 17)
    }
    let signupButton = UIButton().then {
        $0.setTitle("아직 계정이 없으세요?", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        $0.backgroundColor = .white
        $0.setTitleColor(.black, for: .normal)
    }
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        setUp()
    }
    private func setUp(){
        [logoImageView,idTextField,passwordTextField,loginButton,signupButton].forEach {view.addSubview($0)}
        logoImageView.snp.makeConstraints {
            $0.top.greaterThanOrEqualToSuperview().inset(125)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(150)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(59.86)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(16)
            $0.height.equalTo(44)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(60)
            $0.width.equalTo(164)
            $0.height.equalTo(50)
            $0.centerX.equalToSuperview()
        }
        signupButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(22)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(19)
        }
    }
}
extension UITextField {
    
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
