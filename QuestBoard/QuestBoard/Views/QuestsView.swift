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
            
            Image("background").resizable()
            Text(" Quest Board").myFont(size: 30).padding(.bottom, 630).foregroundStyle(.white)
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
                                ZStack {
                                    QuestElement(name: quest.name)
                                }
                            }
                        }
                    }.frame(width: 275, height: 500)
                }
            }
        }.ignoresSafeArea(edges: .top)

        
    }

}

struct QuestElement: View {
    
    var name: String
    
    var body: some View {
        Image("paper").resizable().frame(width: 125, height: 170)
        Text(name)
    }
}


#Preview {
    ContentView()
}
