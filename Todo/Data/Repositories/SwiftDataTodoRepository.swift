//
//  SwiftDataTodoRepository.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import Foundation
import SwiftData

class SwiftDataTodoRepository: TodoRepository {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func getTodos() -> [Todo] {
        let descriptor = FetchDescriptor<Todo>(sortBy: [SortDescriptor(\.createdAt)])
        return (try? modelContext.fetch(descriptor)) ?? []
    }
    
    func addTodo(_ todo: Todo) {
        modelContext.insert(todo)
        try? modelContext.save()
    }
    
    func updateTodo(_ todo: Todo) {
        try? modelContext.save()
    }
    
    func deleteTodo(_ todo: Todo) {
        modelContext.delete(todo)
        try? modelContext.save()
    }
    
    func getTodosByCategory(_ category: Category) -> [Todo] {
        let descriptor = FetchDescriptor<Todo>(sortBy: [SortDescriptor(\.createdAt)])
        let allTodos = (try? modelContext.fetch(descriptor)) ?? []
        
        return allTodos.filter { $0.category == category }
    }
}
