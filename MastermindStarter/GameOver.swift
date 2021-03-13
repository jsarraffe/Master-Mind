//
//  GameOver.swift
//  MastermindStarter
//
//  Created by Jacques Sarraffe on 3/12/21.
//

import SwiftUI

struct GameOver: View {
    var body: some View {
        Text("NICE TRY, this is the CORRECT SOLUTION")
        HStack{
        ForEach (0..<4) { idx in
            GameCircle(diameter: 60, color: colorsList[MasterMindViewModel.sharedView.model.solutions[idx]], id: idx)
           
            }
            Button(action: {
                MasterMindViewModel.sharedView.reset()
                    
            }) {
                Text("Button label")
          }
        }

    }
}

struct GameOver_Previews: PreviewProvider {
    static var previews: some View {
        GameOver()
            .background(Image("mastermindWallpaper"))
    }
}
