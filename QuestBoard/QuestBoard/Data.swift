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
        Quest(name: "String", description: "", icon: "", difficulty: 1, isUrgent: true),
        Quest(name: "String", description: "", icon: "", difficulty: 1, isUrgent: true),
        Quest(name: "String", description: "", icon: "", difficulty: 1, isUrgent: true),
        Quest(name: "String", description: "", icon: "", difficulty: 1, isUrgent: true),
        Quest(name: "String", description: "", icon: "", difficulty: 1, isUrgent: true),
        Quest(name: "String", description: "", icon: "", difficulty: 1, isUrgent: true),
        Quest(name: "String", description: "", icon: "", difficulty: 1, isUrgent: true)
    ]
    
}

var sharedData = SharedData()
