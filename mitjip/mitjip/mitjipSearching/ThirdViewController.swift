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
    @IBOutlet var foodtitle : UILabel!
    @IBOutlet var foodcategory : UILabel!
    @IBOutlet var address : UILabel!
    @IBOutlet var roadAddress : UILabel!
    @IBOutlet var homePageLink : UILabel!
    var data : Int = 0
    var searchList = SearchCommunityListModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(data)
        details()
    }
    func details(){
        let url = URL(string: searchList.searchResult[data].imageLink)
        foodImageView.kf.setImage(with: url)
        address.text = searchList.searchResult[data].address
        foodtitle.text = searchList.searchResult[data].title
        foodcategory.text = searchList.searchResult[data].category
        roadAddress.text = searchList.searchResult[data].roadAddress
        homePageLink.text = searchList.searchResult[data].homePageLink
    }

}

