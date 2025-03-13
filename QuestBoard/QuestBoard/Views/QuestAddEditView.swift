//
//  QuestAddEditView.swift
//  QuestBoard
//
//  Created by Rosario d'Antonio on 13/03/25.
//

import SwiftUI
import SwiftData

struct QuestAddEditView: View {
    
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @Query var quest: [Quest]
    
    //Default Form Value
    @State var name: String = "Name"
    @State var descript: String = "Description"
    @State var icon: String = "text.page"
    @State var difficulty: Int = 1
    @State var isUrgent: Bool = false
    @State var exp: Int = 0
    @State var gold: Int = 0
    @State var completionThreshold: TimeInterval = 0
    @State var completed: Bool = false
    @State var timeOfCompletion: TimeInterval = 0
    @State var selectedDate: Date = .now
    
    //Other Value
    @State var index: Int = -1
    @State var categorySelected = false
    @State private var categoryModal: Bool = false
    
    var body: some View {
        
        ZStack {
            
            //Implementing background and icon for turn back
            Image("backdrop")
            
            Image(systemName: "x.circle")
                .resizable()
                .frame(width: 60, height: 60)
                .foregroundColor(.customBrown)
                .myShadow(weight: 6, color: .black, radius: 2)
                .offset(x: 150, y: -330)
                .padding(.top, 15)
                .onTapGesture {
                    dismiss()
                }
            
            //Implementing the quest paper details
            ZStack {
                
                Image(isUrgent ? "bloodyPaper" : "paper")
                    .resizable()
                    .frame(width: 400, height: 630)
                    .shadow(radius: 10)
                    .padding(.top, 60)
                
                VStack {
                    
                    TextField("Quest Name...", text: $name)
                        .myFont(size: 50)
                        .multilineTextAlignment(.center)
                    
                    
                    let description =
                    TextField("Quest description...", text: $descript)
                        .myFont(size: 20)
                        .multilineTextAlignment(.center)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 290, height: 110)
                        .border(Color.black, width: 2)
                        .overlay(description)
                    //Category
                    ZStack {
                        
                        Image("woodBoard")
                            .resizable()
                            .frame(width: 350, height: 100)
                            .shadow(radius: 5)
                        
                        HStack {
                            
                            if (categorySelected) {
                                
                                Text(returnCategory(icon: icon) + " Quest")
                                    .myFont(size: 20)
                                
                                Image(systemName: icon)
                                    .padding(.leading, 15)
                                
                            } else {
                                
                                Text("Select Category")
                                    .myFont(size: 20)
                                
                            }
                            
                        }.padding(.vertical, 10)
                        
                    }.onTapGesture {
                        categoryModal.toggle()
                    }
                    //--------------------------
                    
                    
                    //Difficulty
                    Text("Difficulty:").myFont(size: 20)
                    
                    HStack {
                        
                        ForEach(0..<5, id: \.self) { i in
                            
                            if (i < difficulty) {
                                
                                Image(systemName: "star.fill")
                                    .foregroundStyle(.yellow)
                                    .myShadow(weight: 6, color: .black, radius: 2)
                                    .onTapGesture { difficulty = i + 1 }
                                
                            } else {
                                
                                Image(systemName: "star")
                                    .foregroundStyle(.black)
                                    .onTapGesture { difficulty = i + 1 }
                                
                            }
                        }
                    }
                    //------------------------
                    
                    
                    //EXP AND GOLD CALCULATION
                    VStack {
                        
                        Text("Experience Earned: " + "\(50 * (NSDecimalNumber(decimal: pow(2.0, difficulty)).intValue))")
                            .myFont(size: 20)
                            .padding(.vertical, -3)
                        
                        
                        Text("Gold Earned: \(50 * difficulty)")
                            .myFont(size: 20)
                        
                    }.foregroundColor(.black).padding(.top, 10)
                    //-----------------------
                    
                    
                    //URGENT CHECKBOX
                    HStack {
                        
                        Text("Urgent?")
                            .myFont(size: 35)
                            .foregroundStyle(Color.black)
                        
                        Button ( action: {
                            isUrgent.toggle()
                        }, label: {
                            Image(systemName: isUrgent ? "checkmark.circle" : "circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(Color.black)
                        })
                        
                    }.padding(.vertical, 15)
                    //----------------------
                    //TO IMPLEMENT
                    //DATE PICKER
                    Text("Select a date and time")
                     .myFont(size: 22)
                     
                     DatePicker("", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
                     .datePickerStyle(.automatic)
                     .padding(.trailing, 40)
                     .myFont(size: 20)
                    //----------------------
                    
                    
                }.frame(width: 280, height: 420).padding(.top, 70)
                
            }//QuestPaper
            
            Rectangle()
                .frame(height: 85)
                .padding(.top, 810)
                .foregroundStyle(Color.customDarkBrown)
            
            
        }.ignoresSafeArea().toolbar {
            
            ToolbarItemGroup(placement: .bottomBar) {
                
                //TURN BACK
                Button(action: {
                    //context.delete()
                    dismiss()
                }) {
                    Image(systemName: "trash")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                
                Spacer()
                
                //SAVE QUEST
                Button(action: {
                    
                    exp = 50 * (NSDecimalNumber(decimal: pow(2.0, difficulty)).intValue)
                    gold = 50 * difficulty
                    
                    print(index)
                    
                    if (index > -1) { //EDIT
                        print("edit")
                        quest[index].name = name
                        quest[index].descript = descript
                        quest[index].icon = icon
                        quest[index].difficulty = difficulty
                        quest[index].isUrgent = isUrgent
                        quest[index].exp = exp
                        quest[index].gold = gold
                        quest[index].completionThreshold = selectedDate.timeIntervalSince1970
                        quest[index].completed = completed
                        quest[index].timeOfCompletion = timeOfCompletion
                    } else { //SAVE
                        print("save")
                        context.insert(
                            Quest (
                                name: name,
                                descript: descript,
                                icon: icon,
                                difficulty: difficulty,
                                isUrgent: isUrgent,
                                exp: exp,
                                gold: gold,
                                completionThreshold: selectedDate.timeIntervalSince1970,
                                completed: completed,
                                timeOfCompletion: timeOfCompletion
                            )
                        )
                        scheduleTaskReminder(taskName: name, thresholdDate: selectedDate)
                    }
                    
                    dismiss() //close the modal
                    
                }) {
                    Image(systemName: "checkmark").resizable().frame(width: 25, height: 25)
                }
            }
        }.onAppear {
            UIToolbar.appearance().barTintColor = UIColor(Color.customDarkBrown)
        }//Toolbar end
        .sheet(isPresented: $categoryModal) {
            CategoryChooseView(icon: $icon, hasSelected: $categorySelected)
        }
    }
}
