import SwiftUI
struct ContentView: View {
    @State var routines = [Routine]()
    @State var addRoutine = false
    @State var newTeamName = ""
    @State var newTeamLevel = ""
    var body: some View{
            VStack {
                ZStack{
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
                List{
                    ForEach(0..<routines.count, id:\.self){item in
                        HStack{
                            Text("\(routines[item].teamName)")
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
            .alert("Add routine", isPresented: $addRoutine) {
                TextField("Team Name:", text: $newTeamName)
                TextField("Team Level:", text: $newTeamLevel)
                Button("Add team"){
                    addTeam()
                }
            }
        
    }
    func addTeam(){
       
            routines.append(Routine(teamName: newTeamName, teamLevel: Int(newTeamLevel)!))
        
    }
}
