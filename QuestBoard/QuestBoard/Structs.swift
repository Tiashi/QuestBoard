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

func ReturnCategory(quest: Quest) -> String {
    
    switch(quest.icon) {
        
    case "text.page":
        return "Default"
    case "shippingbox":
        return "Delivery"
    case "shield.lefthalf.filled":
        return "Escort"
    case "archivebox":
        return "Fetch"
    case "dumbbell":
        return "Training"
    case "hammer":
        return "Crafting"
    case "puzzlepiece.extension":
        return "Puzzle"
        default:
        return "Unknown"
        
    }
    
}
