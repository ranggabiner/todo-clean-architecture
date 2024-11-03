//
//  AddTodoView.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.dismiss) private var dismiss
    let categories: [Category]
    let onAdd: (Todo) -> Void
    
    @State private var title = ""
    @State private var selectedCategory: Category?
    @State private var priority = Priority.medium
    @State private var dueDate = Date()
    @State private var includeDueDate = false
    @State private var notes = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Todo Title", text: $title)
                
                Picker("Category", selection: $selectedCategory) {
                    Text("None").tag(nil as Category?)
                    ForEach(categories) { category in
                        Text(category.name).tag(category as Category?)
                    }
                }
                
                Picker("Priority", selection: $priority) {
                    Text("Low").tag(Priority.low)
                    Text("Medium").tag(Priority.medium)
                    Text("High").tag(Priority.high)
                }
                
                Toggle("Include Due Date", isOn: $includeDueDate)
                
                if includeDueDate {
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }
                
                TextField("Notes", text: $notes, axis: .vertical)
                    .lineLimit(3...6)
            }
            .navigationTitle("New Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let todo = Todo(
                            title: title,
                            dueDate: includeDueDate ? dueDate : nil,
                            priority: priority,
                            category: selectedCategory,
                            notes: notes.isEmpty ? nil : notes
                        )
                        onAdd(todo)
                        dismiss()
                    }
                    .disabled(title.isEmpty)
                }
            }
        }
    }
}

