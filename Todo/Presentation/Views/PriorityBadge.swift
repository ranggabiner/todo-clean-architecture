//
//  PriorityBadge.swift
//  Todo
//
//  Created by Rangga Biner on 02/11/24.
//

import SwiftUI

struct PriorityBadge: View {
    let priority: Priority
    
    var body: some View {
        Text(priority.rawValue)
            .font(.caption2)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(backgroundColor)
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
    
    private var backgroundColor: Color {
        switch priority {
        case .low: return .blue
        case .medium: return .orange
        case .high: return .red
        }
    }
}
