//
//  Untitled.swift
//  QuestBoard
//
//  Created by Rosario d'Antonio on 07/03/25.
//

import SwiftUI

struct GothicText: View {
    
    var text: String
    var size: Int
    
    var body: some View {
        Text(text).font(.custom("Mirage Gothic", size: CGFloat(size)))
    }
    
}
