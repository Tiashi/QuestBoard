//
//  Structs.swift
//  QuestBoard
//
//  Created by Mattia on 06/03/25.
//

import SwiftUI

struct Item: Identifiable {
    var id: UUID = UUID()
    var accessoryName: String
    var stats = Array(repeating: 0, count: 7)
    var itemImage: [String]  // Array with a single element
    var iconImage: String
    var cost: Int
    var sold: Bool = false
    var itemLayers: [Int]  // Array with a single element
}
