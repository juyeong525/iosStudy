import UIKit
import SnapKit
import Then

class AddViewConroller: UIViewController {
    private let infoProductTitleLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "상품명"
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
        $0.font = .systemFont(ofSize: 15)
    }
    private var infoProductHomePageLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "링크"
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
        $0.font = .systemFont(ofSize: 15)
    }
    private var infoProductAllCount = UILabel().then {
        $0.textColor = .black
        $0.text = "전체개수"
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
        $0.font = .systemFont(ofSize: 15)
    }
    private var infoProductMyCount = UILabel().then {
        $0.textColor = .black
        $0.text = "구매개수"
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
        $0.font = .systemFont(ofSize: 15)
    }
    private var productMyCount = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 10
        $0.font = .systemFont(ofSize: 15)
    }
    private var productHomePageLinkTextField = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 10
        $0.font = .systemFont(ofSize: 15)
    }
    private var productTitleTextField = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 10
        $0.font = .systemFont(ofSize: 15)
    }
    private var productAllCount = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 10
        $0.font = .systemFont(ofSize: 15)
    }
    private var infoBuyerAccountLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "계좌번호"
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
        $0.font = .systemFont(ofSize: 15)
    }
    private var BuyerAccountTextField = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 10
        $0.font = .systemFont(ofSize: 15)
    }
    lazy var storeButton = UIButton(type: .system).then {
        $0.backgroundColor = .systemMint
        $0.setTitle("게시", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 15
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeButton.addTarget(self, action: #selector(storeButtonTouch), for: .touchUpInside)
        self.navigationController?.navigationBar.topItem?.title = "추가"
    }
    override func viewDidLayoutSubviews() {
        setUp()
    }
    @objc func storeButtonTouch(_ sender:UIButton){
        let alert = UIAlertController(title: "게시", message: "이 상품을 게시 하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    
    }
    private func setUp(){
        [productTitleTextField,infoProductTitleLabel,productHomePageLinkTextField,infoProductHomePageLabel,productAllCount, infoProductAllCount,productMyCount,infoProductMyCount,storeButton,infoBuyerAccountLabel,BuyerAccountTextField].forEach {view.addSubview($0)}
        infoProductTitleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(150)
            $0.width.equalTo(70)
            $0.height.equalTo(50)
        }
        productTitleTextField.snp.makeConstraints {
            $0.left.equalTo(infoProductTitleLabel.snp.right).offset(15)
            $0.top.equalTo(infoProductTitleLabel.snp.top)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        infoProductHomePageLabel.snp.makeConstraints {
            $0.left.equalTo(infoProductTitleLabel.snp.left)
            $0.top.equalTo(infoProductTitleLabel.snp.bottom).offset(20)
            $0.width.equalTo(70)
            $0.height.equalTo(50)
        }
        productHomePageLinkTextField.snp.makeConstraints {
            $0.left.equalTo(infoProductHomePageLabel.snp.right).offset(15)
            $0.top.equalTo(infoProductHomePageLabel.snp.top)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        infoProductAllCount.snp.makeConstraints {
            $0.left.equalTo(infoProductTitleLabel.snp.left)
            $0.top.equalTo(infoProductHomePageLabel.snp.bottom).offset(20)
            $0.width.equalTo(70)
            $0.height.equalTo(50)
        }
        productAllCount.snp.makeConstraints {
            $0.left.equalTo(infoProductTitleLabel.snp.right).offset(15)
            $0.top.equalTo(infoProductHomePageLabel.snp.bottom).offset(20)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        infoProductMyCount.snp.makeConstraints {
            $0.left.equalTo(infoProductTitleLabel.snp.left)
            $0.top.equalTo(infoProductAllCount.snp.bottom).offset(20)
            $0.width.equalTo(70)
            $0.height.equalTo(50)
        }
        productMyCount.snp.makeConstraints {
            $0.left.equalTo(infoProductHomePageLabel.snp.right).offset(15)
            $0.top.equalTo(infoProductAllCount.snp.bottom).offset(20)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        infoBuyerAccountLabel.snp.makeConstraints {
            $0.left.equalTo(infoProductTitleLabel.snp.left)
            $0.top.equalTo(infoProductMyCount.snp.bottom).offset(20)
            $0.width.equalTo(70)
            $0.height.equalTo(50)
        }
        BuyerAccountTextField.snp.makeConstraints {
            $0.left.equalTo(infoProductHomePageLabel.snp.right).offset(15)
            $0.top.equalTo(infoProductMyCount.snp.bottom).offset(20)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        storeButton.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.left.equalToSuperview().inset(300)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
    }
}

