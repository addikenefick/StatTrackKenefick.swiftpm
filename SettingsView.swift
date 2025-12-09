//
//  SettingsView.swift
//  StatTrackKenefick
//
//  Created by ADDISON KENEFICK on 11/14/25.
//

import SwiftUI
import SwiftData
struct SettingsView: View {
    @Environment(\.modelContext) var context
    @Query var routines: [Routine]
    @State var editTeamName = false
    @State var newName = ""
    var body: some View {
        VStack{
            Button("Edit last team name") {
                editTeamName = true
            }
            .frame(width: 165, height: 35)
            .background(Color("newPink"))
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding()
            .alert("Edit team name", isPresented: $editTeamName) {
                TextField("New name", text: $newName)
                Button("Save") {
                    if let t = routines.last {
                        t.teamName = newName
                        try? context.save()
                    }
                }
            }
            Button("Delete last routine") {
                if routines.count > 0 {
                    context.delete(routines.last!)
                }
            }
            .frame(width: 165, height: 35)
            .background(Color("newPink"))
            .foregroundColor(.red)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding()
            
            Button("Delete last practice") {
                if let team = routines.last {
                    if team.practices.count > 0 {
                        team.practices.removeLast()
                        try? context.save()
                    }
                }
            }
            .frame(width: 165, height: 35)
            .background(Color("newPink"))
            .foregroundColor(.red)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .padding()
            
        }
    }
}

#Preview {
    SettingsView()
}
