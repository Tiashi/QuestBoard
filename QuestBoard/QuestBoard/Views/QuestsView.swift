//  QuestesView.swift
//  QuestBoard
//
//  Created by Mattia on 06/03/25.
//

import SwiftUI

struct QuestsView: View {
    
    var myData = sharedData
    
    var body: some View {
        ZStack() {
            
            Image("background").resizable().frame(width: 460)
            Text(" Quest Board").myFont(size: 30).padding(.bottom, 630).foregroundStyle(.brown).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1)
            if (myData.activeQuests.isEmpty)
            {
                VStack
                {
                    Text("Your Quest Board is looking pretty empty...\n Add a new Quest!").myFont(size: 30).multilineTextAlignment(.center).foregroundStyle(.white).frame(width: 270)
                    Image(systemName: "plus.circle").resizable().frame(width: 200, height: 200).foregroundColor(.white)
                }
            }
            else {
                
                let columns = [GridItem(.flexible()), GridItem(.flexible())]
                
                VStack {
                    ScrollView() {
                        LazyVGrid(columns: columns) {
                            ForEach(myData.activeQuests) { quest in
                                QuestElement(quest: quest)
                                
                            }
                        }
                    }.frame(width: 320, height: 500)
                }
            }
        }.ignoresSafeArea(edges: .top)

        
    }

}

struct QuestElement: View {
    
    var quest: Quest
    
    var body: some View {
        ZStack {Image(quest.isUrgent ? "bloodyPaper" : "paper").resizable().frame(width: 145, height: 190)
            VStack {
                
                HStack {
                    Text(quest.name).myFont(size: 27)
                }
                
                Rectangle().foregroundStyle(.clear).overlay(
                    Text(quest.description).myFont(size: 14)).frame(height: 60)
                

                
                HStack {
                    
                    Image(systemName: "puzzlepiece.extension").resizable().frame(width: 30, height: 30)
                    
                    VStack {
                        Text("Difficulty").myFont(size: 18)
                        HStack {
                            ForEach(0..<5) { _ in
                                Image(systemName: "star.fill").resizable().frame(width: 8, height: 8)
                                    .foregroundColor(.yellow).shadow(color: .black,radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1)
                            }
                        }
                    }
                }
                
            }.padding(.horizontal)
        }
    }
}


#Preview {
    ContentView()
}
