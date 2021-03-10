  
//
//  GuessArea.swift
//  MastermindStarter
//
//  Created by Ali A. Kooshesh on 3/3/21.
//
import SwiftUI

let colorsList: [Color] = [.blue, .yellow, .purple, .red, .green, .black, .gray, .clear]

struct GuessArea: View {
    
    
    @ObservedObject var viewModel = MasterMindViewModel.sharedView

    
    
    var currentGameRow: [Int] = []
    let circleDiameter: CGFloat
    var guessLevels = [GuessRow]()
    
    
    init(diameter: CGFloat) {
        circleDiameter = diameter
        
        
        
        
        for i in 0..<9{
    
            guessLevels.append(GuessRow(circleDiameter: circleDiameter, colors: fourBlankCircles(), id: i))
        }
        
    }
    var body: some View {
        VStack {
            Spacer()

            ForEach( (0..<viewModel.model.guessRows.count).reversed(), id: \.self ) { idx in
                VStack (alignment: .leading, spacing: 20.0) {
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
        currentGameRow = viewModel.model.getLevelColors()

        print(viewModel.model.printGuessRow())
        return [colorsList[currentGameRow[0]], colorsList[currentGameRow[1]], colorsList[currentGameRow[2]], colorsList[currentGameRow[3]]]
    }
}
struct GuessRow: View {
    
    @ObservedObject var viewModel = MasterMindViewModel.sharedView

    let circleDiameter: CGFloat
    var colors: [Color]
    var id: Int
    var body: some View {
        HStack(spacing: 20.0) {
            HStack {
                ForEach( 0..<4 ) { idx in
                    
                    if viewModel.model.currentLevel-1 == id{
                        
                        Button(action:{
                            MasterMindViewModel.sharedView.guess(column: idx)
                            print(MasterMindViewModel.sharedView.model.getLevelColors())
                        }){
        
                            GameCircle(diameter: circleDiameter, color: colorsList[viewModel.model.guessRows[id][idx]], id: idx)
                        }

                    }else{
                        GameCircle(diameter: circleDiameter, color: colorsList[viewModel.model.guessRows[id][idx]], id: idx)
                    }
                    
                    


                }
            }
            FeedbackArea(length: circleDiameter, row: id)
        }
    }
}
