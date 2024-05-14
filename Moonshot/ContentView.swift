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
    
    @State var presentType = true
    var body: some View {
        

            
        if presentType {
            LazyGridMission(theme: $presentType, missions: missions, astronauts: astronauts)
        } else {
            ListMissonView(theme: $presentType, missions: missions, astronauts: astronauts)
        }
    }
}

#Preview {
    ContentView()
}


