import UIKit
import SnapKit
import Then

class AddViewConroller: UIViewController {
    private var infoProductTitleLabel = UILabel().then {
 
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
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        setUp()
    }
    
    private func setUp(){
        view.addSubview(productTitleTextField)
        view.addSubview(infoProductTitleLabel)
        view.addSubview(productHomePageLinkTextField)
        view.addSubview(infoProductHomePageLabel)
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
            $0.top.equalToSuperview().inset(150)
            $0.bottom.equalToSuperview().inset(700)
        }
        infoProductHomePageLabel.snp.makeConstraints {
            $0.right.equalTo(productHomePageLinkTextField.snp.left)
            $0.left.equalToSuperview().inset(50)
            $0.top.equalToSuperview().inset(150)
            $0.bottom.equalToSuperview().inset(700)
        }
    }
}
