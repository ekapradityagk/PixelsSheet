//
//  PlayerDetailView.swift
//  PixelsSheet
//
//  Created by Eka Praditya on 29/01/24.
//

import SwiftUI

struct PlayerDetailView: View {
    @State var showSkill = true
    @State var showItem = true
    
    var playerName : String = ""
//    var skillName: String = ""
//    @State var skillLevel : Int
    
    
    var body: some View {
        Form{
            Section{
                VStack{
                    Text(playerName)
                        .font(.largeTitle).bold()
                }
            }
            
            VStack{
                HStack{
                    Text("Item")
                        .font(.largeTitle)
                        .onTapGesture {
                            showItem.toggle()
                        }
                        .padding(.leading,10)
                }
                if showItem{
                    
                }
                
            }
            
            VStack{
                HStack{
                    Text("Skill")
                        .font(.largeTitle)
                        .onTapGesture {
                            showSkill.toggle()
                        }.padding(.leading, 10)
                    Spacer()
                }

                if showSkill{
                    Section("", content: {
                        HStack{
                            SkillLvListView()
                        }
                    })
                }

            }
            
        }
    }
}

#Preview {
    PlayerDetailView()
}

