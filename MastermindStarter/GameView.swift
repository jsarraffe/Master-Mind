//
//  GameView.swift
//  MastermindStarter
//
//  Created by Ali A. Kooshesh on 3/2/21.
//

import SwiftUI

struct GameView: View {
    var body: some View {
        GeometryReader { geometry in
            body(geometry)
        }
        .padding()
    }
    
    func body(_ geometry: GeometryProxy) -> some View {
        print(geometry.size)
        
        let colors: [Color] = [.blue, .yellow, .purple, .red, .green, .black, .gray]
        
        let paletteAreaWidth = geometry.size.width * 0.20            // 20% goes to palette
        let guessAreaWidth = geometry.size.width - paletteAreaWidth
        let numberOfGuessCircles = 4
        
        let largeCircleDiameter = guessAreaWidth / CGFloat(numberOfGuessCircles + 2) // one for the feedback and one for spaces in between
        
        return
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}