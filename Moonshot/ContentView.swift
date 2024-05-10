//
//  ContentView.swift
//  Moonshot
//
//  Created by Gamıd Khalıdov on 10.05.2024.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(missions) { mission in
                        NavigationLink{
                            Text("Some info")
                        } label: {
                            VStack{
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100,height: 100)
                                VStack{
                                    Text("\(mission.displayedName)")
                                        .font(.headline)
                                    Text(mission.launchDate ?? "N/A")
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                    }
                }
                .navigationTitle("Moonshot")
            }
        }
    }
}

#Preview {
    ContentView()
}
