//
//  GuessArea.swift
//  MastermindStarter
//
//  Created by Ali A. Kooshesh on 3/3/21.
//

import SwiftUI

let colorsList: [Color] = [.blue, .yellow, .purple, .red, .green, .black, .gray, .clear]

struct GuessArea: View {

    var currentGameRow: [Int] = []
    let circleDiameter: CGFloat
    var guessLevels = [GuessRow]()
    
    
    init(diameter: CGFloat) {
        circleDiameter = diameter
        
        
     
        guessLevels.append(GuessRow(circleDiameter: circleDiameter, colors: fourBlankCircles(), id: 0))
    }
    var body: some View {
        VStack {
            Spacer()

            ForEach( 0..<guessLevels.count ) { idx in
                VStack {
                    Divider()
                    guessViewFor(level: idx)
                }
            }
        }
    }
    func guessViewFor(level: Int) -> some View {
//        print("guessViewFor level \(level), size: \(size) ")
        return  guessLevels[level]
    }
    
    mutating func fourBlankCircles() -> [Color] {
        currentGameRow = MasterMindViewModel.shared.getLevelColors()

        print(MasterMindViewModel.shared.printGuessRow())
        return [colorsList[currentGameRow[0]], colorsList[currentGameRow[1]], colorsList[currentGameRow[2]], colorsList[currentGameRow[3]]]
    }
}
struct GuessRow: View {
    let circleDiameter: CGFloat
    var colors: [Color]
    var id: Int
    var y = (MasterMindViewModel.shared.getLevelColors())
    var body: some View {
        HStack(spacing: 20.0) {
            HStack {
                ForEach( 0..<4 ) { idx in
                    Button(action:{
                        MasterMindViewModel.shared.populateGuess(position: idx)
                        print(MasterMindViewModel.shared.getLevelColors())
                    }){
                        
                        GameCircle(diameter: circleDiameter, color: colorsList[idx], id: idx)
                    }

                }
            }
            FeedbackArea(length: circleDiameter)
        }
    }
}
