import SwiftUI

struct QuestDetailView: View {
    
    var quest: Quest
    
    var body: some View {
        
        ZStack {
            
            //Implementing background and icon for turn back
            Image("background")
            
            Image(systemName: "arrow.backward.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.brown)
                .shadow(color: .black, radius: 10)
                .offset(x: -150, y: -330)
                .padding(.top, 15)
            
            //Implementing the quest paper details
            ZStack {
                
                Image(quest.isUrgent ? "paper" : "paper")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 500)
                    .shadow(radius: 10)
                
                
                VStack {
            
                    Text(quest.name)
                        .myFont(size: 50)
                        .padding(.bottom, 10)
                    
                    
                    let _description =
                    Text(quest.description)
                        .myFont(size: 20)
                        .frame(width: 280, height: 100)
                    
                       
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 290, height: 110)
                        .border(Color.black, width: 2)
                        .overlay(_description)
                    
                    ZStack {
                        
                        Image("woodBoard")
                            .resizable()
                            .frame(width: 350, height: 100)
                            .shadow(radius: 5)
                        
                        HStack {
                            
                            Text("Category Name")
                                .myFont(size: 20)
                            
                            Image(systemName: "circle")
                                .padding(.leading, 15)
                            
                        }.padding(.vertical, 10)
                    }
                    
                    
                    Text("Difficulty:").myFont(size: 20)
                    
                    HStack {
                        ForEach(0..<quest.difficulty, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    //To be calculated by an algorithm
                    VStack {
                        Text("Experience Earned: 1500")
                            .myFont(size: 20)
                            .padding(.vertical, 10)
                        Text("Gold Earned: 1500")
                            .myFont(size: 20)
                    }
                    .foregroundColor(.black)
                    .padding(.top, 10)
                    
                }//QuestParer text
                .frame(width: 280, height: 420)
            }//QuestPaper
            
        }.toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                
                Button(action: {
                    print("Oho 1")
                }) {
                    Image(systemName: "circle.fill")
                }
                
                Spacer()
                
                Button(action: {
                    print("Oho 2")
                }) {
                    Image(systemName: "circle.fill")
                }
                
                Spacer()
                
                Button(action: {
                    print("Oho 3")
                }) {
                    Image(systemName: "circle.fill")
                }
                
            }
        }.onAppear {
            
            let barAppearance = UIToolbar.appearance()
            //let itemAppearance = UITabBarItem.appearance()
            
            
            //let myFont = UIFont( name: "Mirage Gothic", size: 14 )!
            
            barAppearance.backgroundColor = UIColor(.brown)
            
            /*itemAppearance.setTitleTextAttributes([
                .font: myFont
            ],for: .normal )
            itemAppearance.setTitleTextAttributes([
                .foregroundColor: UIColor.white,
                .font: myFont
            ],for: .selected )*/
            
        }//toolbarBackground(Color.blue, for: .bottomBar)
        // ^ Back ground and Tool Bar ^
    }
}



#Preview {
    QuestDetailView(
        quest: Quest (
            name: "Quest Name",
            description: "Long description of the quest goes here! oHo :)",
            icon: "circle",
            difficulty: 3,
            isUrgent: true
        )
    )
}
