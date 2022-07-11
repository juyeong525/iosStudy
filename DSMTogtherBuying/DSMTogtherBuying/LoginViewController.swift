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
    var emailTextField = UITextField().then {
        $0.textAlignment = .center
    }
    var passwordTextField = UITextField().then {
        $0.textAlignment = .center
    }
    private let httpClient = HTTPClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func setUp(){
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints {
            $0.left.equalToSuperview().inset(100)
            $0.right.equalToSuperview().inset(100)
            $0.top.equalToSuperview().inset(100)
            $0.bottom.equalToSuperview().inset(700)
        }
        emailTextField.snp.makeConstraints {
            $0.left.equalToSuperview().inset(100)
            $0.right.equalToSuperview().inset(100)
            $0.top.equalToSuperview().inset(100)
            $0.bottom.equalToSuperview().inset(700)
        }
    }
    func login(email: String, password: String) {
        httpClient.post(url: AuthAPI.login.path(), params: ["email": email, "password" : password], header: Header.tokenIsEmpty.header()
        ).responseData(completionHandler: { res in
            switch res.response?.statusCode {
            case 200:
                do {
                    print("성공")
                } catch {
                    print(error)
                }
            default:
                print(res.response?.statusCode ?? 0)
            }
        })
    }
}

