//  ContentView.swift
//  QuestBoard
//
//  Created by Mattia on 05/03/25.
//

import SwiftUI

struct ContentView: View {
    init() {
        let itemAppearance = UITabBarItem.appearance()
        let barAppearance = UITabBar.appearance()
        barAppearance.backgroundColor = UIColor(.brown)
        barAppearance.unselectedItemTintColor = UIColor.black
        UITabBarAppearance().stackedLayoutAppearance.selected.iconColor = UIColor.white
        
        itemAppearance.setTitleTextAttributes([ .font: UIFont(name: "Mirage Gothic", size: 14)!], for: .normal)
        itemAppearance.setTitleTextAttributes([.foregroundColor: UIColor.white, .font: UIFont(name: "Mirage Gothic", size: 14)!], for: .selected)
        }
    
    var profileView = ProfileView()
    var questsView = QuestsView()
    var storeView = StoreView()
    
    var body: some View {
        
        TabView() {
            
            
            profileView.tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }.tag(2)
            questsView.tabItem {
                Image(systemName: "list.clipboard")
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
