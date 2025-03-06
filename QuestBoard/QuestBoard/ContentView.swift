//  ContentView.swift
//  QuestBoard
//
//  Created by Mattia on 05/03/25.
//

import SwiftUI

struct ContentView: View {
    
    var profileView = ProfileView()
    var questsView = QuestsView()
    var storeView = StoreView()
    
    var body: some View {
        
        TabView() {
            profileView.tabItem {
                Image(systemName: "list.clipboard")
                Text("Quests")
            }.tag(2)
            questsView.tabItem {
                Image(systemName: "person.fill")
                Text("Quests")
            }.tag(1)
            storeView.tabItem {
                Image(systemName: "storefront")
                Text("Store")
            }.tag(3)
        }
        
    }
}

#Preview {
    ContentView()
}
