//
//  CategoryChooseView.swift
//  QuestBoard
//
//  Created by Rosario d'Antonio on 10/03/25.
//

import SwiftUI

struct CategoryChooseView: View {
    
    @Environment(\.dismiss) var dismiss
    let categoryNames: [String] = ["Default", "Delivery", "Escort", "Fetch", "Training", "Crafting", "Puzzle"]
    let categoryIcons: [String] = ["text.page", "shippingbox", "shield.lefthalf.filled", "archivebox", "dumbbell", "hammer", "puzzlepiece.extension"]
    
    @Binding var quest: Quest
    @Binding var hasSelected: Bool
    
    var body: some View {
        
        
        ZStack {
            
            Image("backdrop")
            Image(systemName: "x.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.brown)
                .shadow(color: .black, radius: 2).shadow(color: .black, radius: 2).shadow(color: .black, radius: 2)
                .offset(x: 150, y: -330)
                .padding(.top, 15).onTapGesture {
                    dismiss()
                }
            
            
                
            VStack {
                
                ScrollView {
                    ForEach(0..<7) { index in
                        
                        ZStack {
                            Image("woodBoard").resizable().frame(height: 200).padding(.vertical, -15)
                            VStack {
                                Text(categoryNames[index] + " Quest").myFont(size: 30)
                                HStack {
                                    Text("Category description").myFont(size: 18).padding(.top, 15)
                                    Image(systemName: categoryIcons[index]).resizable().frame(width: 30, height: 30).padding(.top, 15)
                                }
                            }
                        }.onTapGesture {
                            quest.icon = categoryIcons[index]
                            hasSelected = true
                            dismiss()
                        }
                        
                    }
                }
                .frame(width: 380, height: 600).padding(.top, 30)
                
                
                
            }

        }.ignoresSafeArea(.all)
        
    }
}

#Preview {
    QuestAddView(quest: Quest(name: "Quest Name", description: "Quest description", icon: "text.page", difficulty: 0, isUrgent: false, completed: false, exp: 100, gold: 100))
                
}
