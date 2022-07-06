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
        [productTitleTextField, productHomePageLinkTextField, productAllCount, productMyCount].enumerated().forEach {
            view.addSubview($1)
            let index = $0
            $1.snp.makeConstraints {
                $0.right.equalToSuperview().inset(50)
                $0.left.equalToSuperview().inset(120)
                $0.top.equalToSuperview().inset(100+index*100)
                $0.bottom.equalToSuperview().inset(750-index*100)
            }
        }
        [infoProductTitleLabel, infoProductHomePageLabel, infoProductAllCount, infoProductMyCount].enumerated().forEach {
            view.addSubview($1)
            let index = $0
            $1.snp.makeConstraints {
                $0.right.equalTo(productTitleTextField.snp.left)
                $0.left.equalToSuperview().inset(50)
                $0.top.equalToSuperview().inset(100+index*100)
                $0.bottom.equalToSuperview().inset(750-index*100)
            }
        }
    }
}
