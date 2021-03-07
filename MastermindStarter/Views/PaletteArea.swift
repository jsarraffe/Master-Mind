//
//  PaletteArea.swift
//  MastermindStarter
//
//  Created by Ali A. Kooshesh on 3/3/21.
//

import SwiftUI

struct PaletteArea: View {
    @State private var offset: CGSize = .zero
    
    let colors: [Color]
    let circleDiameter: CGFloat
    
    var body: some View {
                
        return VStack(alignment: .leading, spacing: 10) {
            ForEach( 0..<colors.count ) { colorIdx in
                Button(action:{
                    
                }){
                    GameCircle(diameter: circleDiameter, color: colors[colorIdx], id: colorIdx)
                }

                
            }
        }
    }
}
