//
//  TodoRowView.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import SwiftUI

struct TodoRowView: View {
    let todo: Todo
    let onToggle: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onToggle) {
                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(todo.isCompleted ? .green : .gray)
            }
            
            VStack(alignment: .leading) {
                Text(todo.title)
                    .strikethrough(todo.isCompleted)
                
                if let dueDate = todo.dueDate {
                    Text(dueDate.formatted(date: .abbreviated, time: .omitted))
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                if let category = todo.category {
                    Text(category.name)
                        .font(.caption)
                        .foregroundColor(Color(category.color))
                }
            }
            
            Spacer()
            
            PriorityBadge(priority: todo.priority)
        }
    }
}

