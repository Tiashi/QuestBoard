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
        
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            profileView.tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }.tag(2)
            questsView.tabItem {
                Image(systemName: "person.fill")
                Text("Quests")
            }.tag(1)
            storeView.tabItem {
                Image(systemName: "person.fill")
                Text("Store")
            }.tag(3)
        }
        
    }
}

#Preview {
    ContentView()
}
