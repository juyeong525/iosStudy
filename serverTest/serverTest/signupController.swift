//
//  signupController.swift
//  serverTest
//
//  Created by 박주영 on 2022/05/31.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var emailCheckButtons: UIButton!
    @IBOutlet weak var emailCheckCodeTextField: UITextField!
    var httpClient = HTTPClient()
    override func viewDidLoad() {
        super.viewDidLoad()
        emailCheckButtons.titleLabel?.text = "인증번호 받기"
        // Do any additional setup after loading the view.
    }
    
    func signup(email: String, password: String, nickName: String,emailCheckCode: String,userType: String) {
        httpClient.post(
            url: AuthAPI.signup.path(),
            params: ["email": email, "emailCheckCode": emailCheckCode, "pw": password, "name": nickName, "userType": userType],
            header: Header.tokenIsEmpty.header()
        ).responseData(completionHandler: { res in
            switch res.response?.statusCode {
            case 200:
                self.navigationController?.popViewController(animated: true)
            default:
                print(res.response?.statusCode ?? 0)
            }
        })
    }

    @IBAction func emailCheckCodeButton(_ sender: UIButton) {
        if emailCheckButtons.titleLabel?.text == "인증번호 받기"{
            httpClient.post(
                url: AuthAPI.emailCheck.path()+"?email="+emailTextField.text!,
                params: nil,
                header: Header.tokenIsEmpty.header()
            ).responseData(completionHandler: { res in
                switch res.response?.statusCode {
                case 200:
                    sender.titleLabel?.text = "인증번호 확인"
                default:
                    print(res.response?.statusCode ?? 0)
                }
            })
        }else{
            return
        }
    }
    @IBAction func signupButtonDidTap(_ sender: UIButton) {
        signup(email: emailTextField.text ?? "",
               password: passwordTextField.text ?? "",
               nickName: nickNameTextField.text ?? "",
               emailCheckCode: emailCheckCodeTextField.text ?? "",
               userType: "USER"
        )
    }
}
