//
//  MasterMindApp.swift
//  MastermindStarter
//
//  Created by Jacques Sarraffe on 3/12/21.
//

import SwiftUI

struct MasterMindApp: View {
    @ObservedObject var viewModel = MasterMindViewModel.sharedView
    var body: some View {
        
        ZStack{
            Image("mastermindWallpaper").resizable().ignoresSafeArea()
            
            if viewModel.model.maxAttempts != true{
                GameView()
            }else{
                GameOver()
            }
            
           
            
        }
    }
}

struct MasterMindApp_Previews: PreviewProvider {
    static var previews: some View {
        MasterMindApp()
    }
}
