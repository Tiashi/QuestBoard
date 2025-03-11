//  QuestesView.swift
//  QuestBoard
//
//  Created by Mattia on 06/03/25.
//

import SwiftUI

struct QuestsView: View {
    
    var myData = sharedData
    @State var addModal: Bool = false
    @State private var refreshTabView = false
    @State private var rotation: Double = 0
    
    var body: some View {
        ZStack {
            NavigationStack {
                ZStack() {
                    
                    Image("background").resizable().frame(width: 460, height: 793).padding(.bottom, 10).ignoresSafeArea(edges: .top)
                    Text(" Quest Board").myFont(size: 30).padding(.bottom, 630).foregroundStyle(Color.customBrown).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1)
                    if (myData.activeQuests.isEmpty)
                    {
                        VStack
                        {
                            Text("Your Quest Board is looking pretty empty...\n Add a new Quest!").myFont(size: 30).multilineTextAlignment(.center).foregroundStyle(Color.customBrown).frame(width: 270).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1)

                            
                            Image(systemName: "plus.circle").resizable().frame(width: 200, height: 200).foregroundColor(.customBrown).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1)
                                .onTapGesture {
                                self.addModal.toggle()
                            }
                        }
                    }
                    else {
                        
                        let columns = [GridItem(.flexible()), GridItem(.flexible())]
                        
                        HStack {
                            
                            
                            Image(systemName: "slider.horizontal.2.square").resizable().frame(width: 50, height: 50).foregroundStyle(.brown).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).onTapGesture {
                            }
                            Spacer().frame(width: 200)
                            Image(systemName: "plus.circle").resizable().frame(width: 50, height: 50).foregroundStyle(.brown).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).onTapGesture {
                                addModal.toggle()
                            }
                        }.padding(.bottom, 500)
                        
                        VStack {
                            ScrollView() {
                                LazyVGrid(columns: columns) {
                                    ForEach(myData.activeQuests) { quest in
                                        QuestElement(quest: quest)
                                        
                                    }
                                }
                            }.frame(width: 320, height: 485).padding(.top, 60)
                        }
                    }
                    
                    
                    VStack {
                        
                        Image("potion" + (myData.questsCompletedToday > 5 ? "5" : "\(myData.questsCompletedToday)")).resizable().rotationEffect(.degrees(rotation)).onAppear {
                            shake()
                        }
                        
                        
                        
                    }.frame(width: 200, height: 200).rotationEffect(.degrees(30)).padding(.top, 600).padding(.leading, 250).ignoresSafeArea()
                    
                    
                    HStack {
                        Text("Fill for extra ").myFont(size: 30).foregroundColor(.customBrown).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).padding(.trailing, -8)
                        Text("gold").myFont(size: 30).foregroundColor(.yellow).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1) .padding(.trailing, -6)
                        Text("!").myFont(size: 30).foregroundColor(.customBrown).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1)
                    }.padding(.top, 685).padding(.trailing, 100)
                    
                }.ignoresSafeArea(edges: .top)
                    .fullScreenCover(isPresented: $addModal) {
                        NavigationView {
                            QuestAddView(quest: Quest(name: "Quest Name", description: "Quest description", icon: "text.page", difficulty: 1, isUrgent: false, completed: false, exp: 100, gold: 100))
                        }
                    }
                
                
                
            }
        }
    }
    
    func shake() {
            Task {
                
                let clampedQuestCompleted = max(0, min(myData.questsCompletedToday, 5))
                
                if myData.questsCompletedToday != 0 {
                    while true {
                        withAnimation(.easeInOut(duration: 0.1)) {
                            rotation = -5 * Double(clampedQuestCompleted)
                        }
                        try? await Task.sleep(nanoseconds: 100_000_000) // 0.1 seconds
                        withAnimation(.easeInOut(duration: 0.1)) {
                            rotation = 5 * Double(clampedQuestCompleted)
                        }
                        withAnimation(.easeInOut(duration: 0.1)) {
                            rotation = 0 // Reset after shaking
                        }
                        
                        let sleepTime: UInt64 = 2_000_000_000 / UInt64(clampedQuestCompleted)
                        
                        try? await Task.sleep(nanoseconds: sleepTime)
                    }
                }
            }
        }
    
}

struct QuestElement: View {
    
    @State var quest: Quest
    
    var body: some View {
        NavigationLink(destination: QuestDetailView(quest: $quest)) {
            ZStack {
                Image(quest.isUrgent ? "bloodyPaper" : "paper").resizable().frame(width: 145, height: 190)
                VStack {
                    
                    Text(quest.name).myFont(size: 27).foregroundStyle(.black).frame(width: 120).minimumScaleFactor(0.5).lineLimit(1)
                    
                    Rectangle().foregroundStyle(.clear).overlay(
                        Text(quest.description).myFont(size: 14)).frame(height: 60).foregroundStyle(.black)
                    
                    
                    HStack {
                        
                        Image(systemName: quest.icon).resizable().frame(width: 30, height: 30).foregroundStyle(.black)
                        
                        VStack {
                            Text("Difficulty").myFont(size: 18).foregroundStyle(.black)
                            HStack {
                                ForEach(0..<quest.difficulty) { int in
                                    Image(systemName: "star.fill").resizable().frame(width: 8, height: 8)
                                        .foregroundColor(.yellow).shadow(color: .black,radius: 1).shadow(color: .black, radius: 1).shadow(color: .black, radius: 1)
                                }
                            }
                        }
                    }
                }.padding(.horizontal)
            }.overlay(
                quest.completed ?
                CompletedView(quest: quest) : nil
            )
        }
    }
}

struct CompletedView: View {
    
    var quest: Quest
    var body: some View {

        ZStack {
            Image("paperBlackMask").resizable().opacity(0.7).frame(width: 145, height: 190)
            VStack {
                Image(systemName: "clock").resizable().frame(width: 50, height: 50).symbolRenderingMode(.monochrome).symbolEffect(.rotate)
                Text("Quest completed").myFont(size: 20).frame(width: 100)
                
                if quest.timeOfCompletion != nil {
                    CountdownTimerView().frame(width: 200)
                    
                }
                
            }
            
        }
        
    }
}

struct CountdownTimerView: View {
    @State private var timeRemaining: Int = 86400 // 24 hours in seconds
    @State private var timerActive = true

    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Text("\(formattedTime())")
                .myFont(size: 25).minimumScaleFactor(0.5).lineLimit(1)
                .padding()
                    }
        .onReceive(timer) { _ in
            if timeRemaining > 0 && timerActive {
                timeRemaining -= 1
            }
        }
    }
    
    func formattedTime() -> String {
        let hours = timeRemaining / 3600
        let minutes = (timeRemaining % 3600) / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

#Preview {
    ContentView()
}
