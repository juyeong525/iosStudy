//
//  ThirdViewController.swift
//  mitjip
//
//  Created by 박주영 on 2022/06/14.
//

import UIKit
import Kingfisher
class ThirdViewController : UIViewController {
    @IBOutlet var foodImageView : UIImageView!
    @IBOutlet var foodTitle : UILabel!
    @IBOutlet var foodCategory : UILabel!
    @IBOutlet var foodAddress : UILabel!
    @IBOutlet var foodRoadAddress : UILabel!
    @IBOutlet var foodHomePageLink : UITextView!
    var data : Int = 0
    var searchList = SearchCommunityListModel()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        details()
        
    }
    func details(){
        foodRoadAddress.numberOfLines = 2
        foodAddress.numberOfLines = 2
        let url = URL(string:searchList.searchResult[data].imageLink)
        foodImageView.kf.setImage(with: url)
        foodTitle.text = searchList.searchResult[data].title
        foodCategory.text = searchList.searchResult[data].category
        foodAddress.text = searchList.searchResult[data].address
        foodRoadAddress.text = searchList.searchResult[data].roadAddress
        foodHomePageLink.text = searchList.searchResult[data].homePageLink
        foodHomePageLink.dataDetectorTypes = .link
        foodHomePageLink.isEditable = false
        
    }
 
}

