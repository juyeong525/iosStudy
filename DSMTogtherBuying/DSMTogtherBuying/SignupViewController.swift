//
//  SignupViewController.swift
//  DSMTogtherBuying
//
//  Created by 박주영 on 2022/07/07.
//
import UIKit
import Then
import SnapKit
class SignupViewController: UIViewController {
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
    var nickNameTextFieldLine = UIView().then {
        $0.backgroundColor = .black
    }
    var eyeButton = UIButton(type: .system).then {
        $0.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        $0.tintColor = .gray
    }
    var signupButton = UIButton(type: .system).then {
        $0.setTitle("회원가이", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 15
    }
    var nickNameTextField = UITextField().then {
        $0.textAlignment = .left
        $0.placeholder = "닉네임"
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
        signupButton.addTarget(self, action: #selector(touchSignupButton), for: .touchUpInside)
    }
    @objc func touchSignupButton(){
        self.dismiss(animated: true)
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
        [emailTextField,passwordTextField,eyeButton,signupButton,nickNameTextField,passwordTextFieldLine,emailTextFieldLine,doubleCheckingButton,nickNameTextFieldLine].forEach({
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
        nickNameTextFieldLine.snp.makeConstraints {
            $0.width.equalTo(nickNameTextField.snp.width)
            $0.height.equalTo(3)
            $0.top.equalTo(nickNameTextField.snp.bottom)
            $0.left.equalTo(nickNameTextField.snp.left)
        }
        eyeButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(30)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
            $0.top.equalTo(passwordTextField.snp.top)
        }
        nickNameTextField.snp.makeConstraints {
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        doubleCheckingButton.snp.makeConstraints {
            $0.right.equalTo(nickNameTextField.snp.right).inset(5)
            $0.height.equalTo(40)
            $0.width.equalTo(60)
            $0.top.equalTo(nickNameTextField.snp.top).inset(5)
        }
        signupButton.snp.makeConstraints {
            $0.bottom.equalTo(view.snp.bottomMargin).inset(15)
            $0.left.equalToSuperview().inset(30)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
    }
}
