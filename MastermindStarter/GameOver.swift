//
//  GameOver.swift
//  MastermindStarter
//
//  Created by Jacques Sarraffe on 3/12/21.
//

import SwiftUI

struct GameOver: View {
    var body: some View {
        
        VStack{
            Text("NICE TRY, this is the CORRECT SOLUTION")
                .bold()
                .foregroundColor(.gray)
            HStack{
            ForEach (0..<4) { idx in
                GameCircle(diameter: 60, color: colorsList[MasterMindViewModel.sharedView.model.solutions[idx]], id: idx)
               
                }
            }
            Button(action: {
                MasterMindViewModel.sharedView.reset()
                    
            }) {
                Text("Play Again?")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .cornerRadius(25)
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
