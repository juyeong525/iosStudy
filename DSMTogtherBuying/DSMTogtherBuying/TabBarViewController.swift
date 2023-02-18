//
//  TabBarViewController.swift
//  DSMTogtherBuying
//
//  Created by 박주영 on 2022/07/04.
//
//TabbarViewController.swift
import UIKit
import SnapKit
import Then

class TabBarViewController: UITabBarController {
    
    var defaultIndex = 0 {
        didSet {
            self.selectedIndex = defaultIndex
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.selectedIndex = defaultIndex
    }
}
extension TabBarViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let firstNavigationController = UINavigationController()
        let firstTabController = ListViewController()
        firstNavigationController.addChild(firstTabController)
        ///기본으로 보여질 이미지
        firstNavigationController.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle.portrait")
        ///선택되었을 때 보여질 이미지
        firstNavigationController.tabBarItem.selectedImage = UIImage(systemName: "list.bullet.rectangle.portrait.fill")
        ///탭바 아이템 타이틀
        firstNavigationController.tabBarItem.title = "목록"
        
        let secondNavigationController = UINavigationController()
        let secondTabController = AddViewConroller()
        secondNavigationController.addChild(secondTabController)
        ///기본으로 보여질 이미지
        secondNavigationController.tabBarItem.image = UIImage(systemName: "plus")
        
        ///선택되었을 때 보여질 이미지
        secondNavigationController.tabBarItem.selectedImage = UIImage(systemName: "plus")
        secondNavigationController.tabBarItem.image?.withTintColor(.black)
        ///탭바 아이템 타이틀
        secondNavigationController.tabBarItem.title = "추가"
        
        
        let thirdNavigationController = UINavigationController()
        let thirdTabController = MyProfileViewController()
        thirdNavigationController.addChild(thirdTabController)
        ///기본으로 보여질 이미지
        thirdNavigationController.tabBarItem.image = UIImage(systemName: "person")
        ///선택되었을 때 보여질 이미지
        thirdNavigationController.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        ///탭바 아이템 타이틀
        thirdNavigationController.tabBarItem.title = "MY"
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.clear
        tabBar.barTintColor = UIColor.white
        ///선택되었을 때 타이틀 컬러
        tabBar.tintColor = UIColor.black
        ///선택안된거 타이틀 컬러
        tabBar.unselectedItemTintColor = UIColor.lightGray
        tabBar.isHidden = false
        self.hidesBottomBarWhenPushed = false
        
        let viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController]
        self.setViewControllers(viewControllers, animated: true)
    }
    
}
