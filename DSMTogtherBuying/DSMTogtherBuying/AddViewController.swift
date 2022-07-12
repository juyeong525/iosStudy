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
    private var label = UILabel().then {
        $0.text = "레이블"
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 15)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        setUp()
    }
    private var skyBlueBox = UILabel()
    private var BlueBox = UILabel()
    
    private func setUp(){
        [productTitleTextField, infoProductTitleLabel,productHomePageLinkTextField,infoProductHomePageLabel, productAllCount, infoProductAllCount,productMyCount,infoProductMyCount].forEach {view.addSubview($0)}
        infoProductTitleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().inset(30)
            $0.top.equalToSuperview().inset(150)
            $0.width.equalTo(80)
            $0.height.equalTo(50)
        }
        productTitleTextField.snp.makeConstraints {
            $0.left.equalTo(infoProductTitleLabel.snp.right)
            $0.top.equalTo(infoProductTitleLabel.snp.top)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        infoProductHomePageLabel.snp.makeConstraints {
            $0.left.equalTo(infoProductTitleLabel.snp.left)
            $0.top.equalTo(infoProductTitleLabel.snp.bottom).offset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(50)
        }
        productHomePageLinkTextField.snp.makeConstraints {
            $0.left.equalTo(infoProductHomePageLabel.snp.right)
            $0.top.equalTo(infoProductHomePageLabel.snp.top)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        infoProductAllCount.snp.makeConstraints {
            $0.left.equalTo(infoProductTitleLabel.snp.left)
            $0.top.equalTo(infoProductHomePageLabel.snp.bottom).offset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(50)
        }
        productAllCount.snp.makeConstraints {
            $0.left.equalTo(infoProductTitleLabel.snp.right)
            $0.top.equalTo(infoProductHomePageLabel.snp.bottom).offset(20)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        infoProductMyCount.snp.makeConstraints {
            $0.left.equalTo(infoProductTitleLabel.snp.left)
            $0.top.equalTo(infoProductAllCount.snp.bottom).offset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(50)
        }
        productMyCount.snp.makeConstraints {
            $0.left.equalTo(infoProductHomePageLabel.snp.right)
            $0.top.equalTo(infoProductAllCount.snp.bottom).offset(20)
            $0.right.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
        skyBlueBox.snp.remakeConstraints {
            $0.top.left.bottom.right.equalToSuperview().inset(50)
        }
        
        BlueBox.snp.remakeConstraints {
            $0.top.equalTo(skyBlueBox.snp.top).offset(50)
            $0.bottom.equalTo(skyBlueBox.snp.bottom).offset(50)
            $0.left.equalTo(skyBlueBox.snp.left).offset(50)
            $0.right.equalTo(skyBlueBox.snp.right).offset(50)
        }
        
    }
}

