//import UIKit
import SnapKit

class ScrollView: UIView {
    let scrollView = UIScrollView()
    
    ///////////// 1번째
    let contentsView = UIView()
    //////////////////////////
    
    let imageView1: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.init(systemName: "Person")
        return imageView
    }()
    
    let imageView2: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.init(systemName: "Person")
        return imageView
    }()
    
    let imageView3: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.init(systemName: "Person")
        return imageView
    }()
    
    let imageView4: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.init(systemName: "Person")
        return imageView
    }()
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        backgroundColor = .black
        ///////////// 2번째
        contentsView.addSubview(imageView1)
        contentsView.addSubview(imageView2)
        contentsView.addSubview(imageView3)
        contentsView.addSubview(imageView4)
        scrollView.addSubview(contentsView)
        
        addSubview(scrollView)
        
        
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        imageView1.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        
        imageView2.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView1.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        
        imageView3.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView2.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        
        imageView4.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(imageView3.snp.bottom).offset(10)
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        
        ///////////// 3번째
        contentsView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.width.equalTo(frame.width)
            make.height.equalTo(frame.height + 500)
        }
    }
}
