//
//  Untitled.swift
//  QuestBoard
//
//  Created by Rosario d'Antonio on 06/03/25.
//

import SwiftUI
import Observation

@Observable
class SharedData {
    
    var activeQuests: [Quest] = [
        Quest(name: "My Quest", description: "Just a simple quest", icon: "", difficulty: 2, isUrgent: true),
        Quest(name: "My Quest", description: "Just a simple quest", icon: "", difficulty: 2, isUrgent: true),
        Quest(name: "My Quest", description: "Just a simple quest", icon: "", difficulty: 2, isUrgent: true),
        Quest(name: "My Quest", description: "Just a simple quest", icon: "", difficulty: 2, isUrgent: false),
        Quest(name: "My Quest", description: "Just a simple quest", icon: "", difficulty: 2, isUrgent: false),
        Quest(name: "My Quest", description: "Just a simple quest", icon: "", difficulty: 2, isUrgent: false)
    ]
    var items: [Item] = [
            Item(accessoryName: "Avatar Name", stats: [0,0,5,0,3,0,7], itemImage: "default", iconImage: "person.circle", cost: 100),
            Item(accessoryName: "Avatar Name", stats: [2,0,0,0,6,0,9], itemImage: "default", iconImage: "person.circle", cost: 200),
            Item(accessoryName: "Avatar Name", stats: [0,4,0,1,0,8,0], itemImage: "default", iconImage: "person.circle", cost: 300),
            Item(accessoryName: "Accessory Name", stats: [0,0,3,7,0,0,5], itemImage: "default", iconImage: "hat.widebrim", cost: 400),
            Item(accessoryName: "Accessory Name", stats: [6,0,0,4,0,2,0], itemImage: "default", iconImage: "hat.widebrim", cost: 500),
            Item(accessoryName: "Accessory Name", stats: [0,9,0,0,1,0,7], itemImage: "default", iconImage: "hat.widebrim", cost: 600),
            Item(accessoryName: "Pet Name", stats: [5,0,0,8,0,0,2], itemImage: "default", iconImage: "pawprint", cost: 700),
            Item(accessoryName: "Pet Name", stats: [0,3,0,0,7,0,6], itemImage: "default", iconImage: "pawprint", cost: 800),
            Item(accessoryName: "Pet Name", stats: [4,0,2,0,0,0,9], itemImage: "default", iconImage: "pawprint", cost: 900),
        ]

}

var sharedData = SharedData()
