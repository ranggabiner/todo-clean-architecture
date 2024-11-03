//
//  TodoUseCases.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import Foundation

class TodoUseCases {
    private let repository: TodoRepository
    
    init(repository: TodoRepository) {
        self.repository = repository
    }
    
    func getTodos() -> [Todo] {
        repository.getTodos()
    }
    
    func addTodo(_ todo: Todo) {
        repository.addTodo(todo)
    }
    
    func updateTodo(_ todo: Todo) {
        repository.updateTodo(todo)
    }
    
    func deleteTodo(_ todo: Todo) {
        repository.deleteTodo(todo)
    }
    
    func getTodosByCategory(_ category: Category) -> [Todo] {
        repository.getTodosByCategory(category)
    }
}
