import SwiftUI

struct QuestDetailView: View {
    @Environment(\.dismiss) var dismiss

    @State private var editModal: Bool = false
    
    @Binding var quest: Quest
    
    var myData = sharedData
    
    var body: some View {
        
        ZStack {
            
            //Implementing background and icon for turn back
            Image("background")
            
            Image(systemName: "arrow.backward.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.brown)
                .shadow(color: .black, radius: 2).shadow(color: .black, radius: 2).shadow(color: .black, radius: 2)
                .offset(x: -150, y: -330)
                .padding(.top, 15).onTapGesture {
                    dismiss()
                }
            
            //Implementing the quest paper details
            ZStack {
                
                Image(quest.isUrgent ? "bloodyPaper" : "paper")
                    .resizable()
                    .frame(width: 400, height: 570)
                    .shadow(radius: 10)
                
                
                VStack {
            
                    Text(quest.name)
                        .myFont(size: 50)
                        .padding(.vertical, 10)
                    
                    
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
                            
                            Text(ReturnCategory(quest: quest) + " Quest")
                                .myFont(size: 24)
                            
                            Image(systemName: quest.icon)
                                .padding(.leading, 15)
                            
                        }.padding(.vertical, 10)
                    }
                    
                    
                    Text("Difficulty:").myFont(size: 20)
                    
                    HStack {
                        ForEach(0..<quest.difficulty, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1)
                        }
                    }
                    
                    //To be calculated by an algorithm
                    VStack {
                        Text("Experience Earned: \(quest.exp)")
                            .myFont(size: 20)
                            .padding(.vertical, 10)
                        Text("Gold Earned: \(quest.gold)")
                            .myFont(size: 20)
                    }
                    .foregroundColor(.black)
                    .padding(.top, 10)
                    
                    Text(quest.completionThreshold?.formatted() ?? "No threshold set").myFont(size: 32).padding(.top, 10)
                    
                }//QuestParer text
                .frame(width: 280, height: 420)
            }//QuestPaper
            
        }
        .ignoresSafeArea()
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                
                Button(action: {
                    addExpAndGold(exp: quest.exp, gold: quest.gold)
                    myData.questsCompletedToday += 1
                    quest.timeOfCompletion = .now
                    quest.completed = true
                    
                    myData.activeQuests.sort { (quest1: Quest, quest2: Quest) -> Bool in
                        if quest1.isUrgent != quest2.isUrgent {
                            return quest1.isUrgent // Among incomplete, urgent tasks come first
                        }
                        return false
                    
                    }
                    
                    dismiss()
                }, label: {
                    Image(systemName: "flag.pattern.checkered").resizable().frame(width: 25, height: 25)
                })
                
                Spacer()
                
                Button(action: {
                    if !quest.completed {
                        editModal.toggle()
                    }
                }, label: {
                    Image(systemName: "pencil").resizable().frame(width: 25, height: 25)
                })
                
                Spacer()
                
                Button(action: {
                    myData.activeQuests.removeAll { $0.id == quest.id }
                }, label: {
                    Image(systemName: "trash")
                })
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            
            
            let barAppearance = UIToolbar.appearance()
            
            //let itemAppearance = UITabBarItem.appearance()
            
            
            //let myFont = UIFont( name: "Mirage Gothic", size: 14 )!
            
            barAppearance.barTintColor = UIColor(Color.customDarkBrown)
            /*itemAppearance.setTitleTextAttributes([
                .font: myFont
            ],for: .normal )
            itemAppearance.setTitleTextAttributes([
                .foregroundColor: UIColor.white,
                .font: myFont
            ],for: .selected )*/
            
        }//toolbarBackground(Color.blue, for: .bottomBar)
        // ^ Back ground and Tool Bar ^
        .fullScreenCover(isPresented: $editModal) {
                NavigationView {
                    
                    let copyOfQuest = clone(quest: quest)
                    
                    QuestEditView(quest: $quest, questCopy: copyOfQuest)
                }
            }
    }
}

func clone(quest: Quest) -> Quest {
    return Quest(name: quest.name, description: quest.description, icon: quest.icon, difficulty: quest.difficulty, isUrgent: quest.isUrgent, completed: quest.completed, exp: quest.exp, gold: quest.gold)
    }


#Preview {
    ContentView()
}
