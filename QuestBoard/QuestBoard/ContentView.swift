import SwiftUI

extension Text {
    func myFont(size customSize: Int) -> some View {
        return self.font(.custom(
            "Mirage Gothic",
            size: CGFloat(customSize)
        ))
    }
}

struct ContentView: View {
    
    @State private var selectedTab = 1 //Default tab bar selection (Quests)
    
    var profileView = ProfileView()
    var questsView = QuestsView()
    var storeView = StoreView()
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            profileView.tabItem {
                Image(systemName: "person.fill")
                Text("Profile")
            }.tag(1)
            
            questsView.tabItem {
                Image(systemName: "list.clipboard")
                Text("Quests")
            }.tag(2)
            
            storeView.tabItem {
                Image(systemName: "storefront")
                Text("Store")
            }.tag(3)
            
        }.onAppear {
            
            let barAppearance = UITabBar.appearance()
            let itemAppearance = UITabBarItem.appearance()
            
            let myFont = UIFont( name: "Mirage Gothic", size: 14 )!
            
            barAppearance.backgroundColor = UIColor(.brown)
            barAppearance.unselectedItemTintColor = UIColor(.black)
            
            itemAppearance.setTitleTextAttributes([
                .font: myFont
            ],for: .normal )
            itemAppearance.setTitleTextAttributes([
                .foregroundColor: UIColor.white,
                .font: myFont
            ],for: .selected )
        }
        
    }
}

#Preview {
    ContentView()
}
