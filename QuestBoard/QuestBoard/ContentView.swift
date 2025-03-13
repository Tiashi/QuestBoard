import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab = 2 //Default tab bar selection (Quests)
    @State private var isTabBarVisible = true
    
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
            
            let myFont = UIFont( name: "Mirage Gothic", size: 14)!
            
            let UIbarAppearance = UITabBarAppearance()
            UIbarAppearance.backgroundColor = UIColor(Color.customDarkBrown)
            
            
            let normalAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor(Color.customBrown), .font: myFont]
            let selectedAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white, .font: myFont]
            
            UIbarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = normalAttributes
            UIbarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttributes
            UIbarAppearance.stackedLayoutAppearance.normal.iconColor = UIColor(Color.customBrown)
            
            
            barAppearance.standardAppearance = UIbarAppearance
            barAppearance.scrollEdgeAppearance = UIbarAppearance
            
            requestNotificationPermission()
        }
        
    }
}

#Preview {
    ContentView()
}

// My Custom Propriety
extension View {
    func myFont(size customSize: Int) -> some View {
        return self.font(.custom(
            "Mirage Gothic",
            size: CGFloat(customSize)
        ))
    }
    
    func myShadow(weight myWeight: Int, color myColor: Color, radius: CGFloat
    ) -> some View {
    
        let view: some View = self
    
        return ZStack {
            ForEach(0..<myWeight, id: \.self) { _ in
                view.shadow(color: myColor, radius: radius)
            }
        }
    }
}
