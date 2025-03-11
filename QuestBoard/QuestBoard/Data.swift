//
//  Untitled.swift
//  QuestBoard
//
//  Created by Rosario d'Antonio on 06/03/25.
//

import SwiftUI
import Observation
import SwiftData

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
            Item(accessoryName: "Avatar Name", stats: [0,0,5,0,3,0,7], itemImage: "default", iconImage: "person.circle", cost: 100),
            Item(accessoryName: "Avatar Name", stats: [2,0,0,0,6,0,9], itemImage: "default", iconImage: "person.circle", cost: 200),
            Item(accessoryName: "Avatar Name", stats: [0,4,0,1,0,8,0], itemImage: "default", iconImage: "person.circle", cost: 300),
            Item(accessoryName: "Accessory Name", stats: [0,0,3,7,0,0,5], itemImage: "default", iconImage: "hat.widebrim", cost: 400),
            Item(accessoryName: "Accessory Name", stats: [6,0,0,4,0,2,0], itemImage: "default", iconImage: "hat.widebrim", cost: 500),
            Item(accessoryName: "Accessory Name", stats: [0,9,0,0,1,0,7], itemImage: "default", iconImage: "hat.widebrim", cost: 600),
            Item(accessoryName: "Pet Name", stats: [5,0,0,8,0,0,2], itemImage: "default", iconImage: "pawprint", cost: 700),
            Item(accessoryName: "Pet Name", stats: [0,3,0,0,7,0,6], itemImage: "default", iconImage: "pawprint", cost: 800),
            Item(accessoryName: "Pet Name", stats: [4,0,2,0,0,0,9], itemImage: "default", iconImage: "pawprint", cost: 900)
        ]
    

}

func addExpAndGold(exp: Int, gold: Int) {
    
    let myData = sharedData
    
    var myExp = exp
    myData.gold += gold
    
    
    while myExp >= myData.expToNextLvl {
        
        myData.level += 1
        
        myExp -= myData.expToNextLvl - myData.exp
        
        myData.exp = 0
        
        myData.expToNextLvl += 200
        
    }
    
    myData.exp += myExp
    
}

var sharedData = SharedData()
