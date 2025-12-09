import SwiftData
//
//  TeamView.swift
//  StatTrackKenefick
//
//  Created by ADDISON KENEFICK on 11/5/25.
//
import SwiftUI

struct TeamView: View {
    @Environment(\.modelContext) var context
    @Query var routines: [Routine]
    @Binding var thisTeam: Routine
    @State var newSkill = false
    @State var logPractice = false
    @State var addedSkill = ""
    @State var practiceDate = Date()
    @State var percent: Double
    @State var hits: Int
    @State var total: Int
    @State var skillAnswers: [String: Bool] = [:]
    
    var body: some View {
        VStack {
            
            ZStack {
                HStack {
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
                HStack {
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
                    ForEach(thisTeam.practices) { p in
                        NavigationLink(
                            "\(p.practiceDay.formatted(date: .numeric, time: .omitted))"
                        ) {
                            PracticeView(thisPractice: p)
                        }
                    }
                }
            }
            HStack {
                Button("Log practice") {
                    logPractice = true
                    hits = 0
                    
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
            
            .alert("Add Skill", isPresented: $newSkill) {
                TextField("What Skill?", text: $addedSkill)
                Button("Add") {
                    thisTeam.skills.append(addedSkill)
                    try? context.save()
                    
                }
            }
            .sheet(isPresented: $logPractice) {
                VStack {
                    
                    ZStack {
                        Text("PRACTICE LOG")
                            .font(.title)
                            .bold()
                            .fontDesign(.serif)
                            .foregroundColor(.gray)
                        Text("PRACTICE LOG")
                            .font(.title)
                            .bold()
                            .fontDesign(.serif)
                            .foregroundColor(Color("newPink"))
                            .blur(radius: 1)
                            .padding()
                    }
                    DatePicker(
                        "Select Practice Date",
                        selection: $practiceDate,
                        in: Date()...,
                        displayedComponents: .date
                    )
                    .padding(.horizontal)
                    .padding(.top, 5)
                    
                    Divider()
                    
                    ScrollView {
                        VStack {
                            ForEach(thisTeam.skills, id: \.self) { skill in
                                HStack {
                                    Text(skill)
                                        .padding(.leading, 10)
                                    Spacer()
                                    Button("Yes") {
                                        
                                        skillAnswers[skill] = true
                                        hits += 1
                                        
                                    }
                                    .frame(width: 45, height: 30)
                                    .background(Color("newPink"))
                                    .foregroundColor(.black)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                                    .disabled(skillAnswers[skill] != nil)
                                    
                                    Button("No") {
                                        
                                        skillAnswers[skill] = false
                                        
                                    }
                                    .frame(width: 45, height: 30)
                                    .background(Color("newPink"))
                                    .foregroundColor(.black)
                                    .clipShape(
                                        RoundedRectangle(cornerRadius: 10)
                                    )
                                    .disabled(skillAnswers[skill] != nil)
                                    .padding(.trailing)
                                }
                                .padding(.vertical)
                                
                                Divider()
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(maxHeight: 400)
                    Button("Save") {
                        loggingPractice()
                        logPractice = false
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("newPink"))
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                }
                .onAppear {
                    skillAnswers = [:]
                    hits = 0
                }
            }
        }
        
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                
                NavigationLink {
                    SettingsView()
                } label: {
                    Image(systemName: "gear")
                }
            }
        }
        
    }
    
    func loggingPractice() {
        let total = max(thisTeam.skills.count, 1)
        let percentt = (Double(hits) / Double(total)) * 100
        
        let newPractice = Practice(hits: hits, total: total, percent: percentt)
        newPractice.practiceDay = practiceDate
        
        thisTeam.practices.append(newPractice)
        
        try? context.save()
    }
    
}
//
//#Preview {
//    TeamView()
//}
