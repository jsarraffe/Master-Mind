//
//  GameCircle.swift
//  MastermindStarter
//
//  Created by Ali A. Kooshesh on 3/3/21.
//

import SwiftUI

struct GameCircle: View, Identifiable {
    let diameter: CGFloat
    let color: Color
    let id: Int
    
    var body: some View {
        
        Circle()
                .strokeBorder(Color.black,lineWidth: 4)
                .background(Circle().foregroundColor(color))
                .frame(width: diameter, height: diameter)
            .rotationEffect(.degrees(12))
    }

}
