//
//  PaletteArea.swift
//  MastermindStarter
//
//  Created by Ali A. Kooshesh on 3/3/21.
//

import SwiftUI

struct PaletteArea: View {
    @State private var offset: CGSize = .zero
    @ObservedObject var viewModel = MasterMindViewModel.sharedView
    
    let colors: [Color]
    let circleDiameter: CGFloat
    
    var body: some View {
        
        
    
        return VStack(alignment: .leading, spacing: 10) {
            GameCircle(diameter: circleDiameter, color: colorsList[viewModel.currColor], id: 999)
            Divider()
            Divider()
            Divider()
            Divider()
            ForEach( 0..<colors.count ) { colorIdx in
                Button(action:{
                    MasterMindViewModel.sharedView.currColor = colorIdx
                    print ("Current Color is \(MasterMindViewModel.sharedView.currColor)")
                  
                }){
                    GameCircle(diameter: circleDiameter, color: colors[colorIdx], id: colorIdx)
                    
                }

                
            }
        }
    }
}
