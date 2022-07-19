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
        $0.textAlignment = .left
        $0.placeholder = "ID"
    }
    var emailTextFieldLine = UIView().then {
        $0.backgroundColor = .black
    }
    var passwordTextField = UITextField().then {
        $0.textAlignment = .left
        $0.isSecureTextEntry = true
        $0.placeholder = "Password"
    }
    var passwordTextFieldLine = UIView().then {
        $0.backgroundColor = .black
    }
    var eyeButton = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        $0.tintColor = .gray
    }
    var loginButton = UIButton(type: .system).then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 15
    }
    var signupLabel = UILabel().then {
        $0.text = "아직 회원가입을 안하셨나요?"
        $0.textAlignment = .left
        $0.textColor = .gray
        $0.font = UIFont.systemFont(ofSize: 15)
    }
    var signupButton = UIButton(type: .system).then {
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.setTitleColor(.gray, for: .normal)
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
        signupButton.addTarget(self, action: #selector(touchSignupButton), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(touchLoginButton), for: .touchUpInside)
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
    @objc func touchSignupButton(){
        let vc = SignupViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    @objc func touchLoginButton(){
        self.dismiss(animated: true)
    }
    func setUp(){
        [emailTextField,passwordTextField,eyeButton,loginButton,signupButton,passwordTextFieldLine,emailTextFieldLine,signupLabel].forEach({
            view.addSubview($0)
        })
        emailTextField.snp.makeConstraints {
            $0.left.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(150)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        emailTextFieldLine.snp.makeConstraints {
            $0.width.equalTo(emailTextField.snp.width)
            $0.height.equalTo(3)
            $0.top.equalTo(emailTextField.snp.bottom)
            $0.left.equalTo(emailTextField.snp.left)
        }
        passwordTextFieldLine.snp.makeConstraints {
            $0.width.equalTo(passwordTextField.snp.width)
            $0.height.equalTo(3)
            $0.top.equalTo(passwordTextField.snp.bottom)
            $0.left.equalTo(passwordTextField.snp.left)
        }
        passwordTextField.snp.makeConstraints {
            $0.left.equalToSuperview().inset(30)
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
        signupLabel.snp.makeConstraints {
            $0.left.equalTo(passwordTextFieldLine.snp.left)
            $0.right.equalTo(signupButton.snp.left)
            $0.top.equalTo(signupButton.snp.top)
            $0.height.equalTo(50)
        }
        loginButton.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottomMargin).inset(15)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        signupButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldLine.snp.bottom).offset(15)
            $0.right.equalTo(passwordTextFieldLine.snp.right)
            $0.width.equalTo(70)
            $0.height.equalTo(50)
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

