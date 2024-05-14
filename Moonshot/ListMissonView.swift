//
//  ListMissonView.swift
//  Moonshot
//
//  Created by Gamıd Khalıdov on 13.05.2024.
//

import SwiftUI

struct ListMissonView: View {
    @Binding var theme: Bool
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    ForEach(missions){ mission in
                        NavigationLink {
                            MissionView(mission: mission, astronauts: astronauts)
                        } label: {
                            HStack{
                                Image(mission.image)
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .scaledToFit()
                                VStack(alignment: .leading){
                                    Text(mission.displayedName)
                                        .font(.title2)
                                    Text(mission.displayedDate)
                                        .font(.caption)
                                }
                            }
                        }
                    }.listRowBackground(Color.lightBackground)
                }
                .navigationTitle("Apollo missions")
                .background(.darkBackground)
                .scrollContentBackground(.hidden)
                }
                .toolbar{
                    Toggle(isOn: $theme, label: {Text("Switch theme").padding(.leading)})
                        .toggleStyle(.switch)
                }
        }
        .preferredColorScheme(.dark)
        
    }

}


#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return ListMissonView(theme: .constant(false), missions: missions, astronauts: astronauts)
}
