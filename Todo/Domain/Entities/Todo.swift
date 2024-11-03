//
//  Todo.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Todo {
    var id: UUID
    var title: String
    var isCompleted: Bool
    var dueDate: Date?
    var priority: Priority
    var category: Category?
    var notes: String?
    var createdAt: Date
    
    init(
        id: UUID = UUID(),
        title: String,
        isCompleted: Bool = false,
        dueDate: Date? = nil,
        priority: Priority = .medium,
        category: Category? = nil,
        notes: String? = nil,
        createdAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
        self.priority = priority
        self.category = category
        self.notes = notes
        self.createdAt = createdAt
    }
}

enum Priority: String, Codable {
    case low, medium, high
    
    var color: Color {
        switch self {
        case .low: return .blue
        case .medium: return .orange
        case .high: return .red
        }
    }
}

