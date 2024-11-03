//
//  TodoApp.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import SwiftUI
import SwiftData

// TodoApp.swift
@main
struct TodoApp: App {
    let modelContainer: ModelContainer
    
    init() {
        do {
            modelContainer = try ModelContainer(
                for: Todo.self, Category.self
            )
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            TodoListView(
                viewModel: TodoListViewModel(
                    todoUseCases: TodoUseCases(
                        repository: SwiftDataTodoRepository(
                            modelContext: modelContainer.mainContext
                        )
                    ),
                    categoryUseCases: CategoryUseCases(
                        repository: SwiftDataCategoryRepository(
                            modelContext: modelContainer.mainContext
                        )
                    )
                )
                )
            .modelContainer(modelContainer)
        }
    }
}
