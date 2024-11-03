//
//  AddCategoryView.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import SwiftUI

struct AddCategoryView: View {
    @Environment(\.dismiss) private var dismiss
    let onAdd: (Category) -> Void
    
    @State private var name = ""
    @State private var color = "blue"
    
    let colors = ["blue", "green", "red", "purple", "orange"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Category Name", text: $name)
                
                Picker("Color", selection: $color) {
                    ForEach(colors, id: \.self) { color in
                        Circle()
                            .fill(Color(color))
                            .frame(width: 24, height: 24)
                            .tag(color)
                    }
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("New Category")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        let category = Category(name: name, color: color)
                        onAdd(category)
                        dismiss()
                    }
                    .disabled(name.isEmpty)
                }
            }
        }
    }
}


