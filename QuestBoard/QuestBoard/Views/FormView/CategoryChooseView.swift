import SwiftUI

struct CategoryChooseView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var icon: String
    @Binding var hasSelected: Bool
    
    let categoryNames: [String] = [
        "Default",
        "Delivery",
        "Escort",
        "Fetch",
        "Training",
        "Crafting",
        "Puzzle"
    ]
    let categoryIcons: [String] = [
        "text.page",
        "shippingbox",
        "shield.lefthalf.filled",
        "archivebox",
        "dumbbell",
        "hammer",
        "puzzlepiece.extension"
    ]
    
    var body: some View {
        
        ZStack {
            
            Image("backdrop")
            
            Image(systemName: "arrow.backward.circle")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(.brown)
                .myShadow(weight: 5, color: .black, radius: 2.5)
                .offset(x: -150, y: -330)
                .padding(.top, 15)
                .onTapGesture { dismiss() }
            
            ScrollView {
                
                ForEach(0..<7) { index in
                    
                    displayCategory(
                        categoryName: categoryNames[index],
                        categoryIcon: categoryIcons[index]
                    ).onTapGesture {
                        icon = categoryIcons[index]
                        hasSelected = true
                        dismiss()
                    }
                    
                }
            }.frame(width: 380, height: 600).padding(.top, 30)
        }.ignoresSafeArea(.all)
    }
}


func displayCategory (
        categoryName name: String,
        categoryIcon icon: String
    ) -> some View {
    
    return ZStack {
        
        Image("woodBoard")
            .resizable()
            .frame(height: 200)
            .padding(.vertical, -15)
        
        VStack {
            
            Text(name + " Quest")
                .myFont(size: 30)
            
            HStack {
                
                Text("Category description")
                    .myFont(size: 18)
                    .padding(.top, 15)
                
                Image(systemName: icon)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.top, 15)
                
            }
        }
    }
}
