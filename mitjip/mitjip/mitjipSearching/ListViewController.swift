//
//  ListViewController.swift
//  mitjip
//
//  Created by 박주영 on 2022/06/17.
//

import UIKit
import Kingfisher
class ListViewController: UIViewController {
    @IBOutlet var myFoodListTableView: UITableView!
    var data = ""
    let httpClient = HTTPClient()
    var searchList = [SearchModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        myFoodListTableView.delegate = self
        myFoodListTableView.dataSource = self
        myFoodListTableView.rowHeight = 100
    }
    override func viewWillAppear(_ animated: Bool) {
        listFood()
    }
    
    @IBAction func allDeleteButton(_ sender: UIBarButtonItem) {
        alertAllDelete(alearTitle: "경고", alertMessage: "진짜 다 삭제 하시겠습니까?")
    }
    func alertAllDelete(alearTitle: String,alertMessage: String){
        let alert = UIAlertController(title: alearTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            self.dismiss(animated: true)
            self.allDelteBarButton()
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    func allDelteBarButton() {
        httpClient.delete(url: "http://10.156.147.167:8080/api/restaurant/delete-all",
                          params: nil,
                          header: Header.isEmpty.header()
        ).responseData(completionHandler: { res in
            switch res.response?.statusCode{
            case 200 :
                print("성공")
                self.listFood()
            default :
                print(res.response?.statusCode ?? 0)
            }
        })
        
    }
    func listFood() {
        httpClient.get(url:"http://10.156.147.167:8080/api/restaurant/all",
                       params: nil,
                       header: Header.isEmpty.header()
        ).responseData(completionHandler: { [unowned self] response in
            switch response.response?.statusCode {
            case 200:
                do {
                    let model = try JSONDecoder().decode([SearchModel].self, from: response.data!)
                    searchList.removeAll()
                    searchList.append(contentsOf: model)
                    myFoodListTableView.reloadData()
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
        myFoodListTableView.register(nibName, forCellReuseIdentifier: "FoodTableViewCell")
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = myFoodListTableView.dequeueReusableCell(withIdentifier: "FoodTableViewCell", for: indexPath) as! SearchTableViewCell
        customCell.foodTitle.text = searchList[indexPath.row].title
        let url = URL(string:searchList[indexPath.row].imageLink)
        customCell.foodImageView.kf.setImage(with: url)
        return customCell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let vc = self.storyboard?.instantiateViewController(identifier: "ListDetailViewController") as? ListDetailViewController else {
                    return
        }
        vc.searchList = searchList
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

