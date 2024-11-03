//
//  Category.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import Foundation
import SwiftData

@Model
final class Category: Identifiable {
    var id: UUID
    var name: String
    var color: String
    @Relationship(deleteRule: .cascade) var todos: [Todo]
    var createdAt: Date
    
    init(
        id: UUID = UUID(),
        name: String,
        color: String = "blue",
        todos: [Todo] = [],
        createdAt: Date = Date()
    ) {
        self.id = id
        self.name = name
        self.color = color
        self.todos = todos
        self.createdAt = createdAt
    }
}

