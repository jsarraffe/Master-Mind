  
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
        

    }
    var body: some View {
        VStack {
            if viewModel.model.didWin == true{
                Text("You did It")
                
            }
            Spacer()
        

            ForEach( (0..<viewModel.model.currlevel).reversed(), id: \.self ) { idx in
                VStack (alignment: .leading, spacing: 20.0) {
                    Divider()
                    
               GuessRow(circleDiameter: circleDiameter, colors: fourBlankCircles(), id: idx)
                        //guessViewFor(level: idx)

                    
                }
            }
        }
    }
    func guessViewFor(level: Int) -> some View {
     
        return  guessLevels[level]
    }
    func fourBlankCircles() -> [Color] {
        

        print(viewModel.model.printGuessRow())
        return [colorsList[viewModel.model.getLevelColors()[0]], colorsList[viewModel.model.getLevelColors()[1]], colorsList[viewModel.model.getLevelColors()[2]], colorsList[viewModel.model.getLevelColors()[3]]]
    }
}
struct GuessRow: View {
    
    var viewModel = MasterMindViewModel.sharedView

    let circleDiameter: CGFloat
    var colors: [Color]
    var id: Int
    var body: some View {
        HStack(spacing: 20.0) {
            HStack {
                ForEach( 0..<4 ) { idx in
                    
                    if viewModel.model.currlevel-1 == id && viewModel.model.didWin != true{
                        
                        Button(action:{
                            MasterMindViewModel.sharedView.guess(column: idx)
                            print(MasterMindViewModel.sharedView.model.getLevelColors())
                        }){
        
                            GameCircle(diameter: circleDiameter, color: colorsList[viewModel.model.guessRows[id][idx]], id: idx)
                        }

                    }else {
                      
                        
                            GameCircle(diameter: circleDiameter, color: colorsList[viewModel.model.guessRows[id][idx]], id: idx)
                            
                    }
                    
                }
            }
            FeedbackArea(length: circleDiameter, row: id)
        }
    }
}
