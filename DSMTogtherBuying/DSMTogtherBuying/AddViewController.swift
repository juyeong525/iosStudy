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
    }
    private var infoProductHomePageLabel = UILabel().then {
        $0.textColor = .black
        $0.text = "링크"
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
    }
    private var productHomePageLinkTextField = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 10
    }
    private var productTitleTextField = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 10
    }
    private var productAllCount = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 10
    }
    private var infoProductAllCount = UILabel().then {
        $0.textColor = .black
        $0.text = "전체개수"
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
    }
    private var productMyCount = UITextField().then {
        $0.textAlignment = .center
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.layer.cornerRadius = 10
    }
    private var infoProductMyCount = UILabel().then {
        $0.textColor = .black
        $0.text = "구매개수"
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.black.cgColor
        $0.textAlignment = .center
        $0.layer.cornerRadius = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        setUp()
    }
    
    private func setUp(){
        [productTitleTextField, infoProductTitleLabel, productHomePageLinkTextField, infoProductHomePageLabel, productAllCount, infoProductAllCount, productMyCount, infoProductMyCount].forEach { view.addSubview($0) }
        productTitleTextField.snp.makeConstraints {
            $0.right.equalToSuperview().inset(50)
            $0.left.equalToSuperview().inset(120)
            $0.top.equalToSuperview().inset(100)
            $0.bottom.equalToSuperview().inset(750)
        }
        infoProductTitleLabel.snp.makeConstraints {
            $0.right.equalTo(productTitleTextField.snp.left)
            $0.left.equalToSuperview().inset(50)
            $0.top.equalToSuperview().inset(100)
            $0.bottom.equalToSuperview().inset(750)
        }
        productHomePageLinkTextField.snp.makeConstraints {
            $0.right.equalToSuperview().inset(50)
            $0.left.equalToSuperview().inset(120)
            $0.top.equalToSuperview().inset(200)
            $0.bottom.equalToSuperview().inset(650)
        }
        infoProductHomePageLabel.snp.makeConstraints {
            $0.right.equalTo(productHomePageLinkTextField.snp.left)
            $0.left.equalToSuperview().inset(50)
            $0.top.equalToSuperview().inset(200)
            $0.bottom.equalToSuperview().inset(650)
        }
        productAllCount.snp.makeConstraints {
            $0.right.equalToSuperview().inset(50)
            $0.left.equalToSuperview().inset(120)
            $0.top.equalToSuperview().inset(300)
            $0.bottom.equalToSuperview().inset(550)
        }
        infoProductAllCount.snp.makeConstraints {
            $0.right.equalTo(productTitleTextField.snp.left)
            $0.left.equalToSuperview().inset(50)
            $0.top.equalToSuperview().inset(300)
            $0.bottom.equalToSuperview().inset(550)
        }
        productMyCount.snp.makeConstraints {
            $0.right.equalToSuperview().inset(50)
            $0.left.equalToSuperview().inset(120)
            $0.top.equalToSuperview().inset(400)
            $0.bottom.equalToSuperview().inset(450)
        }
        infoProductMyCount.snp.makeConstraints {
            $0.right.equalTo(productTitleTextField.snp.left)
            $0.left.equalToSuperview().inset(50)
            $0.top.equalToSuperview().inset(400)
            $0.bottom.equalToSuperview().inset(450)
        }
    }
}
