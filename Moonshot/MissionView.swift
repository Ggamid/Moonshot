//
//  MissionView.swift
//  Moonshot
//
//  Created by Gamıd Khalıdov on 13.05.2024.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMate]
    

    
    var body: some View {
        ScrollView{
            VStack{
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width,axis in
                        width * 0.6
                    }
                
                Rectangle()
                    .frame(height: 2)
                    .foregroundStyle(.lightBackground)
                    .padding(.vertical)
                
                VStack(alignment: .leading){
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    Text(mission.description ?? "")
                    
                    Rectangle()
                        .frame(height: 2)
                        .foregroundStyle(.lightBackground)
                        .padding(.vertical)
                    
                    Text("Crew")
                        .font(.title)
                        .foregroundStyle(.white)
                        .bold()
                }
                .padding(.horizontal)
                
            }
            .padding(.bottom)
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(crew, id: \.role){ crewMember in
                        NavigationLink{
                            AstronautView(astronaut: crewMember.astronaut)
                        } label: {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .overlay{
                                    TextOverlay(astronaut: crewMember.astronaut)
                                }
                                .frame(width: 104*2, height: 72*2)
                                .scaledToFill()
                                .clipShape(.rect(cornerRadius: 10))
                                .padding(.horizontal,5)
                        }
                    }
                }
            }
        }
        .navigationTitle(mission.displayedName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
        
        
        
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map{ member in
            if let astronaut = astronauts[member.name]{
                return CrewMate(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Crew Mate doesn't exist")
            }
            
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}


extension MissionView{
    struct CrewMate{
        let role: String
        let astronaut: Astronaut
    }
    

    
    
}

private struct TextOverlay: View {
    var astronaut: Astronaut
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.9), .black.opacity(0.1)]),
                        startPoint: .bottom,
                        endPoint: .center)
    }
    var body: some View {
        ZStack(alignment: .bottomLeading){
            gradient
            VStack(alignment: .leading){
                Text(astronaut.name)
                    .font(.headline)
                    .bold()
                Text(astronaut.id)
            }
            .padding(5)
        }
        .foregroundStyle(.white)
    }
}
