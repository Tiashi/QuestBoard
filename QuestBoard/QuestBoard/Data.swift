//
//  Untitled.swift
//  QuestBoard
//
//  Created by Rosario d'Antonio on 06/03/25.
//

import SwiftUI
import Observation

extension Color {
    static let customBrown = Color(red: 189/255, green: 165/255, blue: 121/255)
    static let customDarkBrown = Color(red: 94/255, green: 66/255, blue: 53/255)
}

@Observable
class SharedData {
    
    var level: Int = 1
    var exp: Int = 0
    var expToNextLvl: Int = 100
    
    var gold: Int = 0
    
    var stats: [Int] = [0, 0, 0, 0, 0, 0, 0]
    
    var questsCompletedToday: Int = 0
    
    var activeQuests: [Quest] = [
        //Quest(name: "My Quest", description: "Just a simple quest", icon: "puzzlepiece.extension", difficulty: 2, isUrgent: true, completed: false, exp: 100, gold: 50)
        //Quest(name: "My Quest", description: "Just a simple quest", icon: "puzzlepiece.extension", difficulty: 2, isUrgent: true, completed: true),
        /*Quest(name: "My Quest", description: "Just a simple quest", icon: "", difficulty: 2, isUrgent: true, completed: false),
        Quest(name: "My Quest", description: "Just a simple quest", icon: "", difficulty: 2, isUrgent: true, completed: false),
        Quest(name: "My Quest", description: "Just a simple quest", icon: "", difficulty: 2, isUrgent: false, completed: false),
        Quest(name: "My Quest", description: "Just a simple quest", icon: "", difficulty: 2, isUrgent: false, completed: false),
        Quest(name: "My Quest", description: "Just a simple quest", icon: "", difficulty: 2, isUrgent: false, completed: false)*/
    ]
    var items: [Item] = [
        Item(accessoryName: "Man", stats: [0,0,5,0,3,0,7], itemImage: ["male"], iconImage: "person.circle", cost: 10, sold: true, itemLayers: [0]),
        Item(accessoryName: "Woman", stats: [2,0,0,0,6,0,9], itemImage: ["female"], iconImage: "person.circle", cost: 10, sold: true, itemLayers: [0]),
        Item(accessoryName: "Fox", stats: [0,4,0,1,0,8,0], itemImage: ["fox", "foxTail"], iconImage: "person.circle", cost: 10, itemLayers: [0, -2]),
        /*
        Item(accessoryName: "Accessory Name", stats: [0,0,3,7,0,0,5], itemImage: ["hat1"], iconImage: "hat.widebrim", cost: 400, itemLayers: [4]),
        Item(accessoryName: "Accessory Name", stats: [6,0,0,4,0,2,0], itemImage: ["hat2"], iconImage: "hat.widebrim", cost: 500, itemLayers: [5]),
        Item(accessoryName: "Accessory Name", stats: [0,9,0,0,1,0,7], itemImage: ["hat3"], iconImage: "hat.widebrim", cost: 600, itemLayers: [6]),
         */
        Item(accessoryName: "Bird", stats: [5,0,0,8,0,0,2], itemImage: ["birb"], iconImage: "pawprint", cost: 10, itemLayers: [1]),
        Item(accessoryName: "Cat", stats: [0,3,0,0,7,0,6], itemImage: ["catHead", "catTail"], iconImage: "pawprint", cost: 10, itemLayers: [1, -1])
    ]
}

var sharedData = SharedData()
