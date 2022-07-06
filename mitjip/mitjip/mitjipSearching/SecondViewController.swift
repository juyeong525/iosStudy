//
//  SecondViewController.swift
//  mitjip
//
//  Created by 박주영 on 2022/06/09.
//

import UIKit
import Kingfisher
class SecondViewController: UIViewController {
    @IBOutlet var foodTableView : UITableView!
 
    var data = ""
    let httpClient = HTTPClient()
    var searchList = SearchCommunityListModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        foodTableView.delegate = self
        foodTableView.dataSource = self
        foodTableView.rowHeight = 150
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        searchFood()
        
    }
    
    func searchFood() {
        httpClient.get(url:"http://10.156.147.167:8080/api/restaurant/search",
                       params: ["matjip" : data],
                       header: Header.isEmpty.header()
        ).responseData(completionHandler: { [unowned self] response in
            switch response.response?.statusCode {
            case 200:
                do {
                    let model = try JSONDecoder().decode(SearchCommunityListModel.self, from: response.data!)
                    searchList.searchResult.removeAll()
                    searchList.searchResult.append(contentsOf: model.searchResult)
                    foodTableView.reloadData()
                } catch {
                    print(error)
                }
            default:
                print(response.response?.statusCode as Any)
            }
        })
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "SearchTableViewCell", bundle: nil)
        foodTableView.register(nibName, forCellReuseIdentifier: "FoodTableViewCell")
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = foodTableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as! SearchTableViewCell
        customCell.foodTitle.text = searchList.searchResult[indexPath.row].title
        let url = URL(string:searchList.searchResult[indexPath.row].imageLink)
        customCell.foodImageView.kf.setImage(with: url)
        return customCell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController else {
                    return
        }
        vc.data = indexPath.row
        vc.searchList = searchList
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

