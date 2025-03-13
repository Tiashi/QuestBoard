//
//  QuestAddView.swift
//  QuestBoard
//
//  Created by Rosario d'Antonio on 07/03/25.
//

import SwiftUI


/*
struct QuestEditView: View {
    @Environment(\.dismiss) var dismiss
    
    var myData = sharedData
    
    @Binding var quest: Quest
    @State var questCopy: Quest
    
    /*
    let name: String
    let description: String
    let icon: String
    let difficulty: Int
    let isUrgent: Bool
    let completionThreshold: Date?
    let exp: Int
    let gold: Int
    */
    @State private var categoryModal: Bool = false

    @State var categorySelected = true

    var body: some View {
        
        ZStack {
            //Implementing background and icon for turn back
            Image("background")
            
            Image(systemName: "x.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.customBrown)
                .shadow(color: .black, radius: 2).shadow(color: .black, radius: 2).shadow(color: .black, radius: 2)
                .offset(x: 150, y: -330)
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
                    
                    
                    TextField("Quest Name...", text: $quest.name).font(.custom("Mirage Gothic", size: 50)).multilineTextAlignment(.center)
                    
                    
                    let _description =
                    TextField("Quest description...", text: $quest.description).font(.custom("Mirage Gothic", size: 20)).multilineTextAlignment(.center)
                    
                    
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
                            
                            if categorySelected  {
                                Text(ReturnCategory(quest: quest) + " Quest")
                                    .myFont(size: 20)
                                
                                Image(systemName: quest.icon)
                                    .padding(.leading, 15)
                            } else
                            {
                                Text("Select Category")
                                    .myFont(size: 20)
                            }
                        }.padding(.vertical, 10)
                    }.onTapGesture {
                        categoryModal.toggle()
                    }
                    
                    
                    Text("Difficulty:").myFont(size: 20)
                    
                    
                    HStack {
                        ForEach(0..<5, id: \.self) { int in
                            if (int < quest.difficulty) {
                                Image(systemName: "star.fill").foregroundStyle(.yellow).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).onTapGesture {
                                    quest.difficulty = int + 1
                                }
                            }
                            
                            else {
                                Image(systemName: "star").foregroundStyle(.black).onTapGesture {
                                    
                                    quest.difficulty = int + 1
                                    
                                }
                            }
                            
                        }
                    }
                    
                    //To be calculated by an algorithm
                    VStack {
                        
                        Text("Experience Earned: " + "\(quest.exp)")
                            .myFont(size: 20)
                            .padding(.vertical, -3)
                        Text("Gold Earned: 1500")
                            .myFont(size: 20)
                    }
                    .foregroundColor(.black)
                    .padding(.top, 10)
                    
                    HStack {
                        
                        Text("Urgent?").myFont(size: 35).foregroundStyle(Color.black)
                        
                        
                        Button (action:{
                            quest.isUrgent.toggle()
                        }, label: {
                            Image(systemName: quest.isUrgent ? "checkmark.circle" : "circle").resizable().frame(width: 30, height: 30).foregroundStyle(Color.black)
                        })
                    }.padding(.top, 30)
                }//QuestParer text
                .frame(width: 280, height: 420)
            }//QuestPaper
            
            Rectangle().frame(height: 85).padding(.top, 810).foregroundStyle(Color.customDarkBrown)
            
        }.ignoresSafeArea()
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                
                Button(action: {
                    
                    quest.name = questCopy.name
                    quest.description = questCopy.description
                    quest.difficulty = questCopy.difficulty
                    quest.isUrgent = questCopy.isUrgent
                    quest.icon = questCopy.icon
                    quest.completionThreshold = questCopy.completionThreshold
                    quest.exp = questCopy.exp
                    quest.gold = questCopy.gold
                    
                    dismiss()
                }) {
                    Image(systemName: "trash").resizable().frame(width: 30, height: 30)
                }
                
                Spacer()
                
                Button(action: {
                    myData.activeQuests.removeAll { $0.id == quest.id }
                    myData.activeQuests.append(quest)
                    dismiss()
                }) {
                    Image(systemName: "checkmark").resizable().frame(width: 30, height: 30)
                }
                
            }
        }
        .sheet(isPresented: $categoryModal) {
                CategoryChooseView(quest: $quest, hasSelected: $categorySelected)
        }

    }
}


#Preview {
    
    ContentView()
    //QuestAddView(quest: Quest(name: "Quest Name", description: "Quest description", icon: "text.page", difficulty: 1, isUrgent: false, completed: false, exp: 100, gold: 100))
}
*/
