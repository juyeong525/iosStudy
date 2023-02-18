import UIKit
import SnapKit
import Then

class AddViewConroller: UIViewController, UITextFieldDelegate {
    var count = 0
    var upDown = false
    var restoreFrameValue: CGFloat = 0.0
    private var productTitleTextField = UITextField().then {
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
        $0.placeholder = "상품이름:"
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.placeholderText.cgColor
        $0.addLeftPadding()
    }
    private var productHomePageLinkTextField = UITextField().then {
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
        $0.placeholder = "링크:"
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.placeholderText.cgColor
        $0.addLeftPadding()
    }
    private var productAllCountTextField = UITextField().then {
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
        $0.placeholder = "전체개수:"
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.placeholderText.cgColor
        $0.addLeftPadding()    }
    private var productMyCountTextField = UITextField().then {
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
        $0.placeholder = "내가 구매할 개수:"
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.placeholderText.cgColor
        $0.addLeftPadding()    }
    private var BuyerAccountTextField = UITextField().then {
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 15)
        $0.placeholder = "나의 계좌번호:"
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        $0.layer.borderColor = UIColor.placeholderText.cgColor
        $0.addLeftPadding()    }
    private var storeButton = UIButton(type: .system).then {
        $0.backgroundColor = .black
        $0.setTitle("게시", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 15
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeButton.addTarget(self, action: #selector(storeButtonTouch), for: .touchUpInside)
        [productTitleTextField,productHomePageLinkTextField,productAllCountTextField,productMyCountTextField,BuyerAccountTextField].forEach {
            $0.returnKeyType = .done
            $0.delegate = self
        }
        
        self.navigationController?.navigationBar.topItem?.title = "추가"
      
    }
    override func viewDidLayoutSubviews() {
        addSubviews()
        makeSubviewConstraints(frame: view.frame)
        
    }
    @objc func storeButtonTouch(_ sender:UIButton){
        count = 0
        [productTitleTextField,productHomePageLinkTextField,productAllCountTextField,productMyCountTextField,BuyerAccountTextField].forEach {
            if $0.text?.isEmpty == true{
                count += 1
            }
        }
        if count > 0 {
            alert(title: "오류", message: "빈칸이 있습니다")
        }else{
            alert(title: "게시", message: "이 상품을 게시하시겠습니까?")
        }
        self.view.frame.origin.y = self.restoreFrameValue
    }
    private func alert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion:nil)
    }
    private func addSubviews() {
        [productTitleTextField,productHomePageLinkTextField,productAllCountTextField,productMyCountTextField,BuyerAccountTextField,storeButton].forEach {view.addSubview($0)}
    }
    private func makeSubviewConstraints(frame : CGRect) {
        productTitleTextField.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin).inset(20)
            $0.left.right.equalToSuperview().inset(15)
            $0.height.greaterThanOrEqualTo(50)
        }
        productHomePageLinkTextField.snp.makeConstraints {
            $0.top.equalTo(productTitleTextField.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(15)
            $0.height.greaterThanOrEqualTo(50)
        }
        productAllCountTextField.snp.makeConstraints {
            $0.top.equalTo(productHomePageLinkTextField.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(15)
            $0.height.greaterThanOrEqualTo(50)
        }
        productMyCountTextField.snp.makeConstraints {
            $0.top.equalTo(productAllCountTextField.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(15)
            $0.height.greaterThanOrEqualTo(50)
        }
        BuyerAccountTextField.snp.makeConstraints {
            $0.top.equalTo(productMyCountTextField.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(15)
            $0.height.greaterThanOrEqualTo(50)
        }
        storeButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(30)
            $0.top.equalTo(BuyerAccountTextField.snp.bottom).offset(20)
            $0.height.greaterThanOrEqualTo(50)
            
        }
       

    }
    

}
// padding 주기
extension UITextField {
    
    func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}

