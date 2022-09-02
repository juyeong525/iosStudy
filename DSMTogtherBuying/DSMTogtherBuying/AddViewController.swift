import UIKit
import SnapKit
import Then
import AVFoundation

class AddViewConroller: UIViewController ,UIPopoverPresentationControllerDelegate{
    var count = 0
    var upDown = false
    var restoreFrameValue: CGFloat = 0.0
    let imagePickController = UIImagePickerController()
    private var productImageView = UIButton().then {
        $0.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration.init(pointSize: 100), forImageIn: .normal)
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .gray
        $0.setTitle("사진을 불러오세요", for: .normal)
    }
    private var productCommentLabel = UILabel().then {
        $0.layer.cornerRadius = 20
        $0.textAlignment = .center
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 15)
        $0.clipsToBounds = true
        $0.backgroundColor = .systemGray5
        $0.text = "이미지를 눌러 변경하세요 :)"
    }
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
        productImageView.addTarget(self, action: #selector(touchImage), for: .touchUpInside)
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func touchImage(){
        imagePickController.sourceType = .photoLibrary
        imagePickController.delegate = self
        present(imagePickController, animated: true, completion: nil)
    }
    @objc func storeButtonTouch(_ sender:UIButton){
        count = 0
        [productTitleTextField,productHomePageLinkTextField,productAllCountTextField,productMyCountTextField,BuyerAccountTextField].forEach {
            if $0.text?.isEmpty == true{
                count += 1
            }
            if productImageView.currentImage == UIImage.actions{
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
        [productTitleTextField,productCommentLabel,productHomePageLinkTextField,productAllCountTextField,productMyCountTextField,BuyerAccountTextField,storeButton,productImageView].forEach {view.addSubview($0)}
    }
    private func makeSubviewConstraints(frame : CGRect) {
        productImageView.snp.makeConstraints {
            $0.top.equalTo(view.snp.topMargin)
            $0.width.lessThanOrEqualTo(100)
            $0.height.greaterThanOrEqualTo(100)
            $0.centerX.equalToSuperview()
        }
        productCommentLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(10)
            $0.left.right.equalToSuperview().inset(25)
            $0.height.greaterThanOrEqualTo(40)
        }
        productTitleTextField.snp.makeConstraints {
            $0.top.equalTo(productCommentLabel.snp.bottom).offset(20)
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
            $0.bottom.equalTo(view.snp.bottomMargin)
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

extension AddViewConroller : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectionImage = info[.originalImage] as? UIImage{
            print(selectionImage)
            selectionImage.jpegData(compressionQuality: 0.5)
            productImageView.setImage(selectionImage, for: .normal)
            
        }

        dismiss(animated: true,completion: nil)
    }
}
extension AddViewConroller: UITextFieldDelegate {
    
    @objc func keyboardWillAppear(noti: NSNotification) {
        if upDown == false {
            
            let keyboardRectangle = productCommentLabel.frame.origin.y
            self.view.frame.origin.y = -keyboardRectangle
            productCommentLabel.isHidden = true
            productImageView.isHidden = true
            upDown = true
            print("올라감")
        }
    }
    
    @objc func keyboardWillDisappear(noti: NSNotification) {
        if self.view.frame.origin.y != restoreFrameValue {
            self.view.frame.origin.y = restoreFrameValue
            productCommentLabel.isHidden = false
            productImageView.isHidden = false
            upDown = false
            print("내려감")
        }
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("화면 터치")
        upDown = false
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("done버튼 눌림")
        upDown = false
        textField.resignFirstResponder()
        return true
    }
    
}
