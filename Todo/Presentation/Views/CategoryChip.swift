//
//  CategoryChip.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import SwiftUI

struct CategoryChip: View {
    let name: String
    let color: Color
    let isSelected: Bool
    
    var body: some View {
        Text(name)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(isSelected ? color : color.opacity(0.2))
            .foregroundColor(isSelected ? .white : color)
            .clipShape(Capsule())
    }
}
