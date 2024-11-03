//
//  CategoryUseCases.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import Foundation

class CategoryUseCases {
    private let repository: CategoryRepository
    
    init(repository: CategoryRepository) {
        self.repository = repository
    }
    
    func getCategories() -> [Category] {
        repository.getCategories()
    }
    
    func addCategory(_ category: Category) {
        repository.addCategory(category)
    }
    
    func updateCategory(_ category: Category) {
        repository.updateCategory(category)
    }
    
    func deleteCategory(_ category: Category) {
        repository.deleteCategory(category)
    }
}


