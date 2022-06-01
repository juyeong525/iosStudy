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

    let httpClient = HTTPClient()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func signup(email: String, password: String, nickName: String) {
        httpClient.post(
            url: AuthAPI.signup.path(),
            params: ["email": email, "password": password, "nickname": nickName],
            header: Header.tokenIsEmpty.header()
        ).responseJSON(completionHandler: { res in
            switch res.response?.statusCode {
            case 201:
                self.navigationController?.popViewController(animated: true)
            default:
                print(res.response?.statusCode ?? 0)
            }
        })
    }

    @IBAction func signupButtonDidTap(_ sender: UIButton) {
        signup(email: emailTextField.text ?? "",
               password: passwordTextField.text ?? "",
               nickName: nickNameTextField.text ?? ""
        )
    }
}
