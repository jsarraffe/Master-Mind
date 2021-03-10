//
//  GameView.swift
//  MastermindStarter
//
//  Created by Ali A. Kooshesh on 3/2/21.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel = MasterMindViewModel.viewForGame
    
    
    
    var body: some View {
        
        if viewModel.model.didWin == false{
            GeometryReader { geometry in
                body(geometry)
            }
            .padding()
    
            Text("Yessir you Fucking DID it")
                .bold()
        }
        
      
        
        
    }
    
    func body(_ geometry: GeometryProxy) -> some View {
        print(geometry.size)
        
        let colors: [Color] = [.blue, .yellow, .purple, .red, .green, .black, .gray,.clear]
        
        let paletteAreaWidth = geometry.size.width * 0.20            // 20% goes to palette
        let guessAreaWidth = geometry.size.width - paletteAreaWidth
        let numberOfGuessCircles = 4
        
        let largeCircleDiameter = guessAreaWidth / CGFloat(numberOfGuessCircles + 2) // one for the feedback and one for spaces in between
        
        return
            VStack{
                HStack{
                ForEach (0..<4) { idx in
                    GameCircle(diameter: 20, color: colorsList[MasterMindViewModel.sharedView.model.solutions[idx]], id: idx)
                    
                  }
                }
           
            
            
            HStack(alignment: .center) {
                PaletteArea(colors: colors, circleDiameter: largeCircleDiameter)
                    .frame(width: paletteAreaWidth, height: geometry.size.height, alignment: .center)
                    .position(CGPoint(x: paletteAreaWidth / 2.0, y: geometry.size.height / 2.0))

                VStack {
                    GuessArea(diameter: largeCircleDiameter)
                            .frame(width: guessAreaWidth, height: geometry.size.height, alignment: .bottom)
                    Rectangle() // rectangles can serve as spacers.
                        .frame(width: guessAreaWidth, height: largeCircleDiameter, alignment: .bottom)
                        .opacity(0.0)
                }
                
             }
            }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
