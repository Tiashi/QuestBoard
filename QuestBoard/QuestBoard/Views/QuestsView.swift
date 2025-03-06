//  QuestesView.swift
//  QuestBoard
//
//  Created by Mattia on 06/03/25.
//

import SwiftUI

struct QuestsView: View {
    
    var body: some View {
        ZStack() {
            Image("background").resizable()
            
            Text(" Quest Board").font(.custom("Mirage Gothic", size: 30)).padding(.bottom, 620).foregroundStyle(.white)
            Text("Your Quest Board is looking pretty empty...\n Add a new Quest!").font(.custom("Mirage Gothic", size: 30)).multilineTextAlignment(.center).padding(.bottom, 300).foregroundStyle(.white).frame(width: 270)
            Image(systemName: "plus.circle").resizable().frame(width: 200, height: 200).foregroundColor(.white)
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
