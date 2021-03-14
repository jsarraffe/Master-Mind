//
//  GameWin.swift
//  MastermindStarter
//
//  Created by Jacques Sarraffe on 3/13/21.
//

import SwiftUI

struct GameWin: View {
    @ObservedObject var viewModel = MasterMindViewModel.sharedView
    var body: some View {
        ZStack{
            if viewModel.model.didWin == true{
                VStack{
                    Text("Congradulations You have Won!!!")
                        .font(.largeTitle)
                        .baselineOffset(12.0)
                        .frame(alignment: .topLeading)
                        
                    
                    Button(action:{
                        viewModel.reset()
                        

                    })
                    
                    
                    {
                        Text("Reset")
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            
                            
                    }
                    HStack{
                    ForEach (0..<4) { idx in
                        GameCircle(diameter: 60, color: colorsList[MasterMindViewModel.sharedView.model.solutions[idx]], id: idx)
                       
                        }
                        
                    }
                    
                }
               
                }
            }
        
    }
}

struct GameWin_Previews: PreviewProvider {
    static var previews: some View {
        GameWin()
    }
}
