//
//  ViewController.swift
//  toDoList
//
//  Created by 박주영 on 2022/05/24.
//

import UIKit

var todolist = [ToDoList]()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        loadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        setData()
    }

    private func setData() {
        let data = todolist.map {
            [
                "title": $0.todoTitle,
                "content": $0.todoText
            ]
        }
        UserDefaults.standard.set(data, forKey: "item")
        UserDefaults.standard.synchronize()
    }
        func loadData() {
            guard let data = UserDefaults.standard.object(forKey: "item") as? [[String: AnyObject]] else {
                return
            }
            todolist = data.map {
                let title = $0["title"] as? String
                let content = $0["content"] as? String

                return ToDoList(todoTitle: title!, todoText: content!)
            }
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todolist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = todolist[indexPath.row].todoTitle
        cell.detailTextLabel?.text = todolist[indexPath.row].todoText
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            todolist.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        if tableView.isEditing {
            sender.title = ""
            tableView.setEditing(false, animated: true)
        } else {
            sender.title = "Done"
            tableView.setEditing(true, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
           aSㅊㅇ
           let moved = todolist[sourceIndexPath.row]
           todolist.remove(at: sourceIndexPath.row)
           todolist.insert(moved, at: destinationIndexPath.row)
       }
}

