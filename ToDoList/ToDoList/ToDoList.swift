//
//  ToDoList.swift
//  toDoList
//
//  Created by 박주영 on 2022/05/24.
//

import Foundation

struct ToDoList {
    var todoTitle : String = " "
    var todoText : String = " "
    init(todoTitle: String, todoText: String) {
        self.todoTitle = todoTitle
        self.todoText = todoText
        
    }
}
