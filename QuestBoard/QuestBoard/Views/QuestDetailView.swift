//
//  QuestDetailView.swift
//  QuestBoard
//
//  Created by Mattia on 06/03/25.
//

import SwiftUI

struct QuestDetailView: View {
    
    var quest: Quest
    
    var body: some View {
        
        ZStack {
            
            Image("background")
            
            ZStack {
  
                Image("paper")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 400, height: 500)
                
                VStack {
                    
                    Text(quest.name)
                        .font(.largeTitle)
                        
                    
                    Spacer()
                    
                    Image(systemName: quest.icon)
                    Text(quest.description)
                    
                    
                }.frame(width: 400, height: 420)
                
                
                
            } //QuestPaper
                .foregroundColor(.white)
        } //Background
    }
}

#Preview {
    QuestDetailView( quest:
        Quest(
            name: "Quest Name",
            description: "Quest description",
            icon: "star",
            difficulty: 5,
            isUrgent: false
        )
    )
}
