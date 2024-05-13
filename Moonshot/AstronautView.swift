//
//  AstronautView.swift
//  Moonshot
//
//  Created by Gamıd Khalıdov on 13.05.2024.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    
    var body: some View {
        ScrollView{
            Image(astronaut.id)
                .resizable()
                .overlay{
                    TextOverlay(astronaut: astronaut)
                }
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 30))
                .padding()
            
            Text(astronaut.description)
                .padding([.horizontal, .bottom])
                .foregroundStyle(.white)
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return AstronautView(astronaut: astronauts["white"]!)
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
                    .font(.title)
                    .bold()
                Text(astronaut.id)
                    .font(.title2)
            }
            .padding(15)
        }
        .foregroundStyle(.white)
    }
}
