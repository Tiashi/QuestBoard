import SwiftUI
import SwiftData

struct QuestsView: View {
    
    @Query var quest: [Quest]
    
    @State var addModal: Bool = false
    var myData = sharedData
    @State private var potionRotation: Double = 0
    
    var body: some View {
        
        ZStack { NavigationStack { ZStack() {
                
            Image("background")
                .resizable()
                .frame(width: 460, height: 793)
                .padding(.bottom, 10).ignoresSafeArea(edges: .top)
            
            Text(" Quest Board")
                .myFont(size: 30)
                .padding(.bottom, 630)
                .foregroundStyle(Color.customBrown)
                .myShadow(weight: 8, color: .black, radius: 2)
                
            if (quest.count == 0) {
                    
                VStack {
                    
                    Text("Your Quest Board is looking pretty empty...\n Add a new Quest!")
                        .myFont(size: 30)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.customBrown)
                        .frame(width: 270)
                        .myShadow(weight: 10, color: .black, radius: 2)

                    
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .foregroundColor(.customBrown)
                        .myShadow(weight: 14, color: .black, radius: 2)
                        .onTapGesture { addModal.toggle() }
                    
                }
                
            } else {
                    
                let columns = [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]
                    
                HStack {
                    
                    Image(systemName: "slider.horizontal.2.square")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.brown).opacity(0)
                        .myShadow(weight: 8, color: .black, radius: 2)
                        .onTapGesture {}
                    
                    Spacer().frame(width: 200)
                    
                    Image(systemName: "plus.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.brown)
                        .myShadow(weight: 8, color: .black, radius: 2)
                        .onTapGesture { addModal.toggle() }
                    
                }.padding(.bottom, 500)
                    
                //Print all the quest-------------------------------------------------------
                ScrollView() {
                        
                    LazyVGrid(columns: columns) {
                            
                        ForEach(quest.indices, id: \.self) { index in
                            
                            QuestElement(index: index, quest: quest[index])
                            
                        }
                    }
                    
                }.frame(width: 320, height: 485).padding(.top, 60)
                //END Print all the quest-------------------------------------------------------
            }
                
            //Potion
            VStack {
                let temp = (
                    myData.questsCompletedToday > 5 ?
                    "5"
                    :
                    "\(myData.questsCompletedToday)"
                )
            
            Image("potion" + temp)
                .resizable()
                .rotationEffect(.degrees(potionRotation))
                .onAppear { shake() }
                
            }
            .frame(width: 200, height: 200)
            .rotationEffect(.degrees(30))
            .padding(.top, 600)
            .padding(.leading, 250)
            .ignoresSafeArea()
            
            
            HStack {
                
                Text("Fill for extra ")
                    .foregroundColor(.customBrown)
                    .padding(.trailing, -8)
                
                Text("gold")
                    .foregroundColor(.yellow)
                    .padding(.trailing, -6)
                
                Text("!")
                    .foregroundColor(.customBrown)
                    
            }
            .myShadow(weight: 8, color: .black, radius: 2)
            .myFont(size: 30)
            .padding(.top, 685)
            .padding(.trailing, 100)
            
            
        }.ignoresSafeArea(edges: .top).fullScreenCover(isPresented: $addModal) {
            NavigationView {
                QuestAddEditView() //ADDING NEW QUEST
            }
        }}}
    }//End Body

    
    func shake() {
        
        Task {
        
            let clampedQuestCompleted = max(0, min(myData.questsCompletedToday, 5))
            
            if myData.questsCompletedToday != 0 {
                while true {
                    withAnimation(.easeInOut(duration: 0.1)) {
                        potionRotation = -5 * Double(clampedQuestCompleted)
                    }
                    try? await Task.sleep(nanoseconds: 100_000_000) // 0.1 seconds
                    withAnimation(.easeInOut(duration: 0.1)) {
                        potionRotation = 5 * Double(clampedQuestCompleted)
                    }
                    withAnimation(.easeInOut(duration: 0.1)) {
                        potionRotation = 0 // Reset after shaking
                    }
                    
                    let sleepTime: UInt64 = 2_000_000_000 / UInt64(clampedQuestCompleted)
                    
                    try? await Task.sleep(nanoseconds: sleepTime)
                }
            }
        }
    }
}
struct QuestElement: View {
    
    @State var index: Int
    var quest: Quest
    
    var body: some View {
        
        NavigationLink(
            destination: QuestDetailView(index: index, quest: quest)
        ) {
            
            ZStack {
                
                Image(quest.isUrgent ? "bloodyPaper" : "paper")
                    .resizable()
                    .frame(width: 145, height: 190)
                
                VStack {
                    
                    Text(quest.name)
                        .myFont(size: 27)
                        .foregroundStyle(.black)
                        .frame(width: 120)
                        .minimumScaleFactor(0.5).lineLimit(1)
                    
                    Rectangle()
                        .foregroundStyle(.clear)
                        .frame(height: 60)
                        .overlay(
                            Text(quest.descript)
                                .myFont(size: 14)
                                .foregroundStyle(.black)
                        )
                            
                    HStack {
                        
                        Image(systemName: quest.icon)
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.black)
                        
                        VStack {
                            
                            Text("Difficulty")
                                .myFont(size: 18)
                                .foregroundStyle(.black)
                            
                            HStack {
                                
                                ForEach(0..<quest.difficulty, id: \.self) { _ in
                                    
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 8, height: 8)
                                        .foregroundColor(.yellow)
                                        .shadow(color: .black, radius: 1)
                                        .shadow(color: .black, radius: 1)
                                        .shadow(color: .black, radius: 1)
                                    
                                }
                            }
                        }
                    }
                }.padding(.horizontal)
            }.overlay(
                quest.completed ? CompletedView(quest: quest) : nil
            )
        }
    }
}

//An overlay for completed quests
struct CompletedView: View {
    
    var quest: Quest
    var body: some View {

        ZStack {
            
            Image("paperBlackMask")
                .resizable()
                .opacity(0.7)
                .frame(width: 145, height: 190)
            
            VStack {
                
                Image(systemName: "clock")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .symbolRenderingMode(.monochrome)
                    .symbolEffect(.rotate)
                
                Text("Quest completed")
                    .myFont(size: 20)
                    .frame(width: 100)
                
                if quest.completed == true {
                    CountdownTimerView(completionTime: quest.timeOfCompletion)
                        .frame(width: 200)
                }
            }
        }
    }
}

struct CountdownTimerView: View {
    
    @State var completionTime: TimeInterval = 0
    @State private var timeRemaining: Int = 10800// 3 hours in seconds
    @State private var timerActive = true
    
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
            Text("\(formattedTime())")
                .myFont(size: 25)
                .minimumScaleFactor(0.5)
                .lineLimit(1)
                .padding()
            
        }.onReceive(timer) { _ in
            if timeRemaining > 0 && timerActive {
                timeRemaining -= 1
            }
        }
    }
    
    func formattedTime() -> String {
        
        let timeElapsed = Int(Date.now.timeIntervalSince1970 - completionTime)
        let realTimeRemaining = timeRemaining - timeElapsed
        
        let hours = realTimeRemaining / 3600
        let minutes = (realTimeRemaining % 3600) / 60
        let seconds = realTimeRemaining % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
