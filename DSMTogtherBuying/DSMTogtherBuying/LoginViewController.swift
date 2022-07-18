//
//  File.swift
//  DSMTogtherBuying
//
//  Created by 박주영 on 2022/07/06.
//

import UIKit
import Alamofire
import SnapKit
import Then

class LoginViewController: UIViewController {
    private let httpClient = HTTPClient()
    var eyeButtonTouching = false
    var emailTextField = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 15
    }
    var passwordTextField = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.isSecureTextEntry = true
        $0.layer.cornerRadius = 15
    }
    var eyeButton = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        $0.tintColor = .gray
    }
    var infoEmailLabel = UILabel().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.text = "이메일"
        $0.layer.cornerRadius = 15
    }
    var infoPasswordLabel = UILabel().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.text = "비밀번호"
        $0.layer.cornerRadius = 15
    }
    var nickNameTextField = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 15
    }
    var infoNickNameLabel = UILabel().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.text = "닉네임"
        $0.layer.cornerRadius = 15
    }
    var doubleCheckingButton = UIButton(type: .system).then {
        $0.setTitle("중복확인", for: .normal)
        $0.tintColor = .gray
        $0.layer.cornerRadius = 15
        $0.layer.borderWidth = 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buttonTarget()
    }
    override func viewDidLayoutSubviews() {
        setUp()
    }
    func buttonTarget(){
        eyeButton.addTarget(self, action: #selector(selectedEyeButton), for: .touchUpInside)
        doubleCheckingButton.addTarget(self, action: #selector(selectedDoubleCheckButton), for: .touchUpInside)
    }
    @objc func selectedEyeButton(_ sender : UIButton){
        if eyeButtonTouching == false {
            sender.setImage(UIImage(systemName: "eye"), for: .normal)
            eyeButtonTouching = true
            passwordTextField.isSecureTextEntry = false
        }else{
            sender.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            eyeButtonTouching = false
            passwordTextField.isSecureTextEntry = true
        }
        
    }
    @objc func selectedDoubleCheckButton(){
        
    }
    func setUp(){
        [infoEmailLabel,emailTextField,infoPasswordLabel,passwordTextField,eyeButton,nickNameTextField,infoNickNameLabel,doubleCheckingButton].forEach({
            view.addSubview($0)
        })
        infoEmailLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(100)
            $0.height.equalTo(50)
            $0.width.equalTo(70)
        }
        emailTextField.snp.makeConstraints {
            $0.left.equalTo(infoEmailLabel.snp.right).offset(15)
            $0.top.equalToSuperview().inset(100)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        infoPasswordLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(30)
            $0.top.equalTo(infoEmailLabel.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.width.equalTo(70)
        }
        passwordTextField.snp.makeConstraints {
            $0.left.equalTo(infoPasswordLabel.snp.right).offset(15)
            $0.right.equalToSuperview().inset(30)
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        eyeButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(30)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
            $0.top.equalTo(passwordTextField.snp.top)
        }
        nickNameTextField.snp.makeConstraints {
            $0.left.equalTo(infoNickNameLabel.snp.right).offset(15)
            $0.right.equalToSuperview().inset(30)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        infoNickNameLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(30)
            $0.top.equalTo(infoPasswordLabel.snp.bottom).offset(20)
            $0.height.equalTo(50)
            $0.width.equalTo(70)
        }
        doubleCheckingButton.snp.makeConstraints {
            $0.right.equalTo(nickNameTextField.snp.right).inset(5)
            $0.height.equalTo(40)
            $0.width.equalTo(60)
            $0.top.equalTo(nickNameTextField.snp.top).inset(5)
            
        }
        
    }
    func login(email: String, password: String) {
        httpClient.post(url: AuthAPI.login.path(), params: ["email": email, "password" : password], header: Header.tokenIsEmpty.header()
        ).responseData(completionHandler: { res in
            switch res.response?.statusCode {
            case 200:
                print("성공")
            default:
                print(res.response?.statusCode ?? 0)
            }
        })
    }
}

