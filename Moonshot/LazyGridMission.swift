//
//  LazyGridMission.swift
//  Moonshot
//
//  Created by Gamıd Khalıdov on 13.05.2024.
//

import SwiftUI

struct LazyGridMission: View {
    @Binding var theme: Bool
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    

    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(missions) { mission in
                        NavigationLink{
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            VStack{
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100,height: 100)
                                    .padding()
                                    .shadow(color: .white.opacity(0.7), radius: 10)
                                VStack{
                                    Text("\(mission.displayedName)")
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.displayedDate)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                .background(.lightBackground)
                            }
                            .clipShape(.rect(cornerRadius: 10))
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.lightBackground)
                            }
                            
                            
                        }
                        
                    }
                    .padding([.horizontal, .bottom])
                }
                .navigationTitle("Moonshot")
                
            }
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar{
                Button{
                    theme.toggle()
                } label: {
                    Image(systemName: theme ? "square.grid.2x2" : "list.dash")
                }
            }
        }

    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return LazyGridMission(theme: .constant(false), missions: missions, astronauts: astronauts)
}
