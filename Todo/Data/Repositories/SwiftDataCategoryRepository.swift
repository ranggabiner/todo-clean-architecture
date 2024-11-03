//
//  SwiftDataCategoryRepository.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import Foundation
import SwiftData

class SwiftDataCategoryRepository: CategoryRepository {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func getCategories() -> [Category] {
        let descriptor = FetchDescriptor<Category>(sortBy: [SortDescriptor(\.createdAt)])
        return (try? modelContext.fetch(descriptor)) ?? []
    }
    
    func addCategory(_ category: Category) {
        modelContext.insert(category)
        try? modelContext.save()
    }
    
    func updateCategory(_ category: Category) {
        try? modelContext.save()
    }
    
    func deleteCategory(_ category: Category) {
        modelContext.delete(category)
        try? modelContext.save()
    }
}


