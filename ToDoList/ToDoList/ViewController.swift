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
        // Do any additional setup after loading the view.
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
           
           let moved = todolist[sourceIndexPath.row]
           todolist.remove(at: sourceIndexPath.row)
           todolist.insert(moved, at: destinationIndexPath.row)
       }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

