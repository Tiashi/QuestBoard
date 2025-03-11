//
//  Structs.swift
//  QuestBoard
//
//  Created by Mattia on 06/03/25.
//

import SwiftUI

struct Quest: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var icon: String
    var difficulty: Int
    var isUrgent: Bool
    var completed: Bool
    var completionThreshold: Date?
    var timeOfCompletion: Date?
    
    var exp: Int
    var gold: Int
}

struct Item: Identifiable {
    
    var id: UUID = UUID()
    var accessoryName: String
    var stats = Array(repeating: 0, count: 7)
    var itemImage: String
    var iconImage: String
    var cost: Int
    var sold: Bool = false
}
