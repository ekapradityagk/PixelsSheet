//
//  SkillLvListView.swift
//  PixelsSheet
//
//  Created by Eka Praditya on 30/01/24.
//

import SwiftUI

struct SkillLvListView: View {
    
    var body: some View {
        HStack{
            skillViewer(skillName: "Cooking", skillLevel: 20)
            skillViewer(skillName: "Brewing", skillLevel: 20)
            skillViewer(skillName: "Beekeeping", skillLevel: 20)
        }
    }
}

#Preview {
    SkillLvListView()
}

struct skillViewer : View {
    
    var skillName: String = ""
    @State var skillLevel : Int = 0
    
    
    var body: some View {
        VStack{
            Text(skillName)
                .padding(.vertical, 10)
                .font(.caption).bold()
            
            Text("\(skillLevel)")
                .font(.title).bold()
                .padding(.vertical,2)
            
            Stepper("",value: $skillLevel, in: 0...999)
        
            Spacer()
        }
        .padding(.trailing, 8)
        .frame(minWidth: UIScreen.main.bounds.width/2-90, maxHeight: 140)
        .background(.radialGradient(colors: [.white,.white], center: .center, startRadius: 55, endRadius: 200))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .gray, radius: 10, x: 1.0, y: 1.0)
        .padding(.horizontal,3)
    }
}
