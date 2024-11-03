//
//  TodoListView.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import SwiftUI

struct TodoListView: View {
    @StateObject private var viewModel: TodoListViewModel
    @State private var showingAddTodo = false
    @State private var showingAddCategory = false
    
    init(viewModel: TodoListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                CategoryListView(
                    categories: viewModel.categories,
                    selectedCategory: $viewModel.selectedCategory,
                    onDelete: viewModel.deleteCategory
                )
                
                List {
                    ForEach(viewModel.todos) { todo in
                        TodoRowView(todo: todo) {
                            viewModel.toggleTodo(todo)
                        }
                    }
                    .onDelete { indexSet in
                        indexSet.forEach { index in
                            viewModel.deleteTodo(viewModel.todos[index])
                        }
                    }
                }
            }
            .navigationTitle("Todo List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { showingAddCategory = true }) {
                        Image(systemName: "folder.badge.plus")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddTodo = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddTodo) {
                AddTodoView(
                    categories: viewModel.categories,
                    onAdd: viewModel.addTodo
                )
            }
            .sheet(isPresented: $showingAddCategory) {
                AddCategoryView(onAdd: viewModel.addCategory)
            }
        }
    }
}

