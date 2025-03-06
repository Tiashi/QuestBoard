//  QuestesView.swift
//  QuestBoard
//
//  Created by Mattia on 06/03/25.
//

import SwiftUI

struct QuestsView: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("background").resizable()
            
            Text(" Quest Board").font(.custom("Mirage Gothic", size: 30)).padding(.top, 74).foregroundStyle(.white)
            VStack {
                ScrollView() {
                    
                }.frame(width: 300, height: 570).padding(.top, 120)
            }
        }.ignoresSafeArea(edges: .top)
    }
}

#Preview {
    QuestsView()
}
