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
}
