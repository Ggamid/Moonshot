//
//  AustronautsScrollView.swift
//  Moonshot
//
//  Created by Gamıd Khalıdov on 13.05.2024.
//

import SwiftUI

struct AustronautsScrollView: View {
    let crew: [CrewMate]
    
    var body: some View {
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
    
}


struct CrewMate{
    let role: String
    let astronaut: Astronaut
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
