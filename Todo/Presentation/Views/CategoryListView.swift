//
//  CategoryListView.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import SwiftUI

struct CategoryListView: View {
    let categories: [Category]
    @Binding var selectedCategory: Category?
    let onDelete: (Category) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                CategoryChip(
                    name: "All",
                    color: .gray,
                    isSelected: selectedCategory == nil
                )
                .onTapGesture {
                    selectedCategory = nil
                }
                
                ForEach(categories) { category in
                    CategoryChip(
                        name: category.name,
                        color: Color(category.color),
                        isSelected: category.id == selectedCategory?.id
                    )
                    .onTapGesture {
                        selectedCategory = category
                    }
                    .contextMenu {
                        Button(role: .destructive) {
                            onDelete(category)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
                }
            }
            .padding()
        }
    }
}
