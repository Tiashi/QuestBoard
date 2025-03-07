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
            //------------------------------------------
            
            ZStack {
                
                Image("paper")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 500)
                    .shadow(radius: 10)
                
                VStack {
            
                    Text("Quest Name")
                        .myFont(size: 50)
                        .padding(.bottom, 10)
                    
                    
                    let _description =
                    Text("Long description of the quest goes here! oHo :)")
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
                        ForEach(0..<5) { _ in
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
            .foregroundColor(.black)
        }//Background
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


/*

import SwiftUI

struct QuestDetailView: View {
    
    var quest: Quest
    
    var body: some View {
        
        ZStack {
            
            Image("background")
                .resizable()
                .ignoresSafeArea(edges: .top)
            
            

            ZStack {
                Image("paper")
                    .resizable()
                    .frame(width: 380, height: 550)
                    .shadow(radius: 10)
                
                VStack(spacing: 10) {
                    Text("Quest Name")
                        .font(.custom("Papyrus", size: 40))
                        .bold()
                        .foregroundColor(.black)
                        .padding(.top, 20)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: 280, height: 100)
                        .overlay(
                            Text("Quest description")
                                .font(.custom("Papyrus", size: 18))
                                .foregroundColor(.black)
                        )
                        .border(Color.black, width: 2)
                        .padding(.top, 5)
                    
                    ZStack {
                        Image("wood_board")
                            .resizable()
                            .frame(width: 400, height: 100)
                            .shadow(radius: 5)
                        
                        Text("Category")
                            .font(.custom("Papyrus", size: 24))
                            .foregroundColor(.black)
                            .shadow(color: .gray, radius: 1)
                    }
                    
                    Text("Difficulty:")
                        .font(.custom("Papyrus", size: 20))
                        .foregroundColor(.black)
                    
                    HStack {
                        ForEach(0..<5) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    
                    VStack {
                        Text("Experience Earned: 1500")
                        Text("Gold Earned: 1500")
                    }
                    .font(.custom("Papyrus", size: 18))
                    .foregroundColor(.black)
                    .padding(.top, 10)
                    
                }
            }
        }
        
        //tab bar
       
        VStack {
                Spacer()

                   // Custom Toolbar
                   HStack {
                       // Left Icon: Flag
                       Button(action: {
                           print("Flag button tapped")
                       }) {
                           Image(systemName: "flag.checkered")
                               .resizable()
                               .frame(width: 30, height: 30)
                               .foregroundColor(.white)
                       }

                       Spacer()

                       // Center Icon: Pencil
                       Button(action: {
                           print("Edit button tapped")
                       }) {
                           Image(systemName: "pencil")
                               .resizable()
                               .frame(width: 25, height: 25)
                               .foregroundColor(.white)
                       }

                       Spacer()

                       // Right Icon: Trash
                       Button(action: {
                           print("Delete button tapped")
                       }) {
                           Image(systemName: "trash")
                               .resizable()
                               .frame(width: 30, height: 30)
                               .foregroundColor(.white)
                       }
                   }
                   .padding()
                   .frame(height: 50)
                   .background(Color.brown)
               }
               .edgesIgnoringSafeArea(.bottom)
           }
    }
*/

