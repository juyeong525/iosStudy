//
//  SecondViewController.swift
//  mitjip
//
//  Created by 박주영 on 2022/06/09.
//

import UIKit

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
       
        
    }
    override func viewWillAppear(_ animated: Bool) {
        searchFood()
    }
    func searchFood() {
        httpClient.get(url:"/api/restaurant/search",
                       params: ["matjip" : data],
                       header: Header.isEmpty.header()
        ).responseJSON { [unowned self] response in
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
                print(response.response?.statusCode)
            }
        }
    }
    
    private func registerXib() {
        let nibName = UINib(nibName: "SearchTableViewCell", bundle: nil)
        foodTableView.register(nibName, forCellReuseIdentifier: "FoodTableViewCell")
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = foodTableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as! SearchTableViewCell
        customCell.foodTitle.text = searchList.searchResult[indexPath.row].title
        return customCell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ThirdViewController") as? ThirdViewController else {
                    return
        }
        vc.data = indexPath.row
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

