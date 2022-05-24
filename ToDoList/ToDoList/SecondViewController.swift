//
//  SecondViewController.swift
//  toDoList
//
//  Created by 박주영 on 2022/05/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func doneButton(_ sender: UIBarButtonItem) {
        let title = titleTextField.text!
        let content = contentTextView.text!
        let item : ToDoList = ToDoList(todoTitle: title, todoText: content)
        todolist.append(item)
        self.navigationController?.popViewController(animated: true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
