//
//  TodoListViewModel.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import Foundation

@MainActor
class TodoListViewModel: ObservableObject {
    @Published var todos: [Todo] = []
    @Published var categories: [Category] = []
    @Published var selectedCategory: Category?
    
    private let todoUseCases: TodoUseCases
    private let categoryUseCases: CategoryUseCases
    
    init(todoUseCases: TodoUseCases, categoryUseCases: CategoryUseCases) {
        self.todoUseCases = todoUseCases
        self.categoryUseCases = categoryUseCases
        loadData()
    }
    
    func loadData() {
        categories = categoryUseCases.getCategories()
        todos = selectedCategory == nil ?
            todoUseCases.getTodos() :
            todoUseCases.getTodosByCategory(selectedCategory!)
    }
    
    func addTodo(_ todo: Todo) {
        todoUseCases.addTodo(todo)
        loadData()
    }
    
    func toggleTodo(_ todo: Todo) {
        todo.isCompleted.toggle()
        todoUseCases.updateTodo(todo)
        loadData()
    }
    
    func deleteTodo(_ todo: Todo) {
        todoUseCases.deleteTodo(todo)
        loadData()
    }
    
    func addCategory(_ category: Category) {
        categoryUseCases.addCategory(category)
        loadData()
    }
    
    func deleteCategory(_ category: Category) {
        categoryUseCases.deleteCategory(category)
        loadData()
    }
}


