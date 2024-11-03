//
//  CategoryRepository.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import Foundation

protocol CategoryRepository {
    func getCategories() -> [Category]
    func addCategory(_ category: Category)
    func updateCategory(_ category: Category)
    func deleteCategory(_ category: Category)
}
