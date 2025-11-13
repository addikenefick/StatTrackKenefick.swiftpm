//
//  TeamView.swift
//  StatTrackKenefick
//
//  Created by ADDISON KENEFICK on 11/5/25.
//

import SwiftUI
import SwiftData
struct TeamView: View {
    @Environment(\.modelContext) var context
    @Query var routines: [Routine]
    @Binding var thisTeam: Routine
    @State var newSkill = false
    @State var logPractice = false
    @State var addedSkill = ""
    @State var practiceDate = Date()

    var body: some View {
        VStack{
            ZStack {
                VStack{
                    Text("\(thisTeam.teamName)")
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.serif)
                        .foregroundColor(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Text("\(thisTeam.teamLevel)")
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.serif)
                        .foregroundColor(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                VStack{
                    Text("\(thisTeam.teamName)")
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.serif)
                        .foregroundColor(Color("newPink"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .blur(radius: 1)
                    Text("\(thisTeam.teamLevel)")
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.serif)
                        .foregroundColor(Color("newPink"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .blur(radius: 1)
                    
                }
            }
            List {
                if thisTeam.practices.isEmpty {
                    Text("No practices yet")
                        .foregroundColor(.gray)
                } else {
                    ForEach(thisTeam.practices, id: \.self) { p in
                        Text(p)
                    }
                }
            }
            HStack{
                Button("Log practice"){
                   logPractice = true
                   
                }
                .frame(width: 165, height: 35)
                .background(Color("newPink"))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
                Button("Add skill") {
                    newSkill = true
                    
                    
                }
                .frame(width: 165, height: 35)
                .background(Color("newPink"))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
                
            }
            
            .alert("Add Skill", isPresented: $newSkill){
                TextField("What Skill?", text: $addedSkill)              
                Button("Add") {
                    thisTeam.skills.append(addedSkill)
                    try? context.save()
                    print(addedSkill)
                }
            }
            .sheet(isPresented: $logPractice) {
                Form{
                    DatePicker("Practice Date", selection: $practiceDate, in: Date()..., displayedComponents: .date)
                }
                Button("Save"){
                    loggingPractice()
                    logPractice.toggle()
                }
            }
        }
    }
    func loggingPractice(){
    
        thisTeam.practices.append("\(practiceDate)")
    }
  
}

//
//#Preview {
//    TeamView()
//}
