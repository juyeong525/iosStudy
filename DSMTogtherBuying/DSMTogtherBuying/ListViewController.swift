//
//  ListViewController.swift
//  DSMTogtherBuying
//
//  Created by 박주영 on 2022/07/04.
//

import UIKit
import SnapKit
import Then

class ListViewController: UIViewController {
    var ListTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        ListTableView.delegate = self
        ListTableView.dataSource = self
        ListTableView.register(BuyingListTableViewCell.self, forCellReuseIdentifier: "buyingListTableViewCell")
        ListTableView.rowHeight = 80
        self.navigationController?.navigationBar.topItem?.title = "목록"
        }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setUp()
    }
    func setUp(){
        view.addSubview(ListTableView)
        ListTableView.snp.makeConstraints {
            $0.left.equalTo(view.snp.left)
            $0.right.equalTo(view.snp.right)
            $0.bottom.equalTo(200)
            $0.top.equalTo(view.snp.topMargin)
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "buyingListTableViewCell", for: indexPath) as! BuyingListTableViewCell
        cell.buyingListTitle.text = "1"
        cell.buyerImage.image = UIImage.remove
        cell.buyerNickName.text = "주멘"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ListDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)

   }
}
