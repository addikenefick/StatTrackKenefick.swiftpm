import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var context
    @Query var routines: [Routine]
    @State var addRoutine = false
    @State var newTeamName = ""
    @State var newTeamLevel = ""
    var body: some View{
        NavigationStack {
            VStack{
                ZStack {
                    Text("CHEER TRACKER")
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.serif)
                        .foregroundColor(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                    Text("CHEER TRACKER")
                        .font(.largeTitle)
                        .bold()
                        .fontDesign(.serif)
                        .foregroundColor(Color("newPink"))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .blur(radius: 1)
                        .padding()
                }
                List {
                    ForEach(routines) { routine in              HStack{
                        Text(routine.teamName)
                        NavigationLink("\(routine.teamLevel)") {
                            TeamView(thisTeam: .constant(routine), percent: 0.0, hits: 0, total: 0)
                            
                        }
                    }
                    }
                }
                
                Button("Add new routine") {
                    addRoutine = true
                }
                .frame(width: 165, height: 35)
                .background(Color("newPink"))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding()
                
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
            
            
            
            .alert("Add routine", isPresented: $addRoutine) {
                TextField("Team Name:", text: $newTeamName)
                TextField("Team Level:", text: $newTeamLevel)
                Button("Add team") {
                    addTeam()
                    
                }
            }
            
        }
    }
    func addTeam() {
        let newRoutine = Routine(teamName: newTeamName, teamLevel: newTeamLevel)
        context.insert(newRoutine)
        try? context.save()
    }
}
