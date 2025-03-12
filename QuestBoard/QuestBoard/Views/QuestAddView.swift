//
//  QuestAddView.swift
//  QuestBoard
//
//  Created by Rosario d'Antonio on 07/03/25.
//

import SwiftUI



struct QuestAddView: View {
    @Environment(\.dismiss) var dismiss
    
    var myData = sharedData
    
    @State var quest: Quest
    @State private var selectedDate = Date()
    @State private var categoryModal: Bool = false

    @State var categorySelected = false

    var body: some View {
        
        ZStack {
            
            //Implementing background and icon for turn back
            Image("backdrop")
            
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
                    .frame(width: 400, height: 630)
                    .shadow(radius: 10).padding(.top, 60)
                
                
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
                        
                        Text("Experience Earned: " + "\(50 * (NSDecimalNumber(decimal: pow(2.0, quest.difficulty)).intValue))")
                            .myFont(size: 20)
                            .padding(.vertical, -3)
                        Text("Gold Earned: \(50 * quest.difficulty)")
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
                    }.padding(.vertical, 15)
                    
                    Text("Select a date and time").myFont(size: 22)
                    DatePicker("", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.automatic)
                        .padding(.trailing, 40).font(.custom("Mirage Gothic", size: 20))
                    
                }//QuestParer text
                .frame(width: 280, height: 420).padding(.top, 70)
            }//QuestPaper
            
            Rectangle().frame(height: 85).padding(.top, 810).foregroundStyle(Color.customDarkBrown)
            
        }.ignoresSafeArea()
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                
                
                Button(action: {
                    dismiss()
                }) {
                    Image(systemName: "trash").resizable().frame(width: 25, height: 25)
                }
                
                Spacer()
                
                Button(action: {
                    if !categorySelected {
                        quest.icon = "text.page"
                    }
                    quest.exp = 50 * (NSDecimalNumber(decimal: pow(2.0, quest.difficulty)).intValue)
                    quest.gold = 50 * quest.difficulty
                    quest.completionThreshold = selectedDate
                    myData.activeQuests.append(quest)
                    
                    
                    myData.activeQuests.sort { (quest1: Quest, quest2: Quest) -> Bool in
                        if quest1.isUrgent != quest2.isUrgent {
                            return quest1.isUrgent // Among incomplete, urgent tasks come first
                        }
                        return false
                    }
                    dismiss()
                }) {
                    Image(systemName: "checkmark").resizable().frame(width: 25, height: 25)
                }
                
    
                
            }
        }
        .sheet(isPresented: $categoryModal) {
                CategoryChooseView(quest: $quest, hasSelected: $categorySelected)
        }
        .onAppear {
                
                let barAppearance = UIToolbar.appearance()
                
                //let itemAppearance = UITabBarItem.appearance()
                
                
                //let myFont = UIFont( name: "Mirage Gothic", size: 14 )!
                
                barAppearance.barTintColor = UIColor(Color.customDarkBrown)
            }

    }
}

#Preview {
    QuestAddView(quest: Quest(name: "Quest Name", description: "Quest description", icon: "text.page", difficulty: 1, isUrgent: false, completed: false, exp: 100, gold: 100))
}
