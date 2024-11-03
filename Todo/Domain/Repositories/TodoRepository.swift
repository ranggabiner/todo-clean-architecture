//
//  TodoRepository.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import Foundation

protocol TodoRepository {
    func getTodos() -> [Todo]
    func addTodo(_ todo: Todo)
    func updateTodo(_ todo: Todo)
    func deleteTodo(_ todo: Todo)
    func getTodosByCategory(_ category: Category) -> [Todo]
}

