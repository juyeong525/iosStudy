//
//  ViewController.swift
//  serverTest
//
//  Created by 박주영 on 2022/05/31.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let httpClient = HTTPClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func login(email: String, password: String) {
        httpClient.post(url: AuthAPI.login.path(), params: ["email": email, "password" : password], header: Header.tokenIsEmpty.header()
        ).responseData(completionHandler: { res in
            switch res.response?.statusCode {
            case 200:
                do {
                    let model = try JSONDecoder().decode(TokenModel.self, from: res.data!)
                    Token.accesstoken = model.access_token
                    Token.refreshToken = model.resfresh_token
                } catch {
                    print(error)
                }
            default:
                print(res.response?.statusCode ?? 0)
            }
        })
        
    }
    @IBAction func signupButtonDidTap(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "SignupViewController") as? SignupViewController else {
                return
            }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }


}

