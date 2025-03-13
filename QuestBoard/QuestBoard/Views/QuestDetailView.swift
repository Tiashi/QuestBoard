import SwiftUI
import SwiftData

struct QuestDetailView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    //@Query var allQuests: [Quest]
    
    @State var index: Int
    @State var quest: Quest
    
    @State private var editModal: Bool = false
    
    var myData = sharedData
    
    var body: some View {
        
        ZStack {
            
            //Implementing background and icon for turn back
            Image("background")
            
            Image(systemName: "arrow.backward.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.brown)
                .shadow(color: .black, radius: 2)
                .shadow(color: .black, radius: 2)
                .shadow(color: .black, radius: 2)
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
                    Text(quest.descript)
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
                            
                            Text(returnCategory(icon: quest.icon) + " Quest")
                                .myFont(size: 24)
                            
                            Image(systemName: quest.icon)
                                .padding(.leading, 15)
                            
                        }.padding(.vertical, 10)
                    }
                    
                    
                    Text("Difficulty:").myFont(size: 20)
                    
                    HStack {
                        ForEach(0..<quest.difficulty, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .shadow(color: .black, radius: 1)
                                .shadow(color: .black, radius: 1)
                                .shadow(color: .black, radius: 1)
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
                    
                    Text("\(Date(timeIntervalSince1970: quest.completionThreshold).formatted())")
                    .myFont(size: 32)
                    .padding(.top, 10)
                    
                }//QuestParer text
                .frame(width: 280, height: 420)
            }//QuestPaper
            
        }.ignoresSafeArea().toolbar {
            
            ToolbarItemGroup(placement: .topBarTrailing) {
                
                //QUEST COMPLETED
                Button(action: {
                    
                    addExpAndGold(exp: quest.exp, gold: quest.gold)
                    
                    myData.questsCompletedToday += 1
                    
                    quest.timeOfCompletion = Date.now.timeIntervalSince1970
                    
                    quest.completed = true
                    
                    dismiss()
                    
                }, label: {
                    Image(systemName: "flag.pattern.checkered")
                        .resizable()
                        .frame(width: 25, height: 25)
                })
                
                Spacer()
                
                //EDIT QUEST
                Button(action: {
                    if !quest.completed {
                        editModal.toggle()
                    }
                }, label: {
                    Image(systemName: "pencil").resizable().frame(width: 25, height: 25)
                })
                /*
                Spacer()
                
                //REMOVE QUEST
                Button(action: {
                    print("delete")
                    context.delete(allQuests[index])
                }, label: {
                    Image(systemName: "trash")
                })
                */
            }
        }.navigationBarBackButtonHidden(true).onAppear {
            UIToolbar.appearance().barTintColor = UIColor(Color.customDarkBrown)
        }.fullScreenCover(isPresented: $editModal) {
            NavigationView {
                
                //Edit the quest based on id
                QuestAddEditView(
                    name: quest.name,
                    descript: quest.descript,
                    icon: quest.icon,
                    difficulty: quest.difficulty,
                    isUrgent: quest.isUrgent,
                    exp: quest.exp,
                    gold: quest.gold,
                    completionThreshold: quest.completionThreshold,
                    completed: quest.completed,
                    timeOfCompletion: quest.timeOfCompletion,
                    index: index
                ).onDisappear {
                    //when edit is finished close the detail modal
                    dismiss()
                }
            }
        }
    }
}
