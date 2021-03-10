//
//  MasterMindViewModel.swift
//  MastermindStarter
//
//  Created by Jacques Sarraffe on 3/6/21.
//

import Foundation

class MasterMindViewModel: ObservableObject{
     
    
    @Published var currColor: Int = 7
    
    
    @Published var model = MasterMindModel()
    
    static var sharedView = MasterMindViewModel()

    
    func guess(column : Int) {
    

       model.populateGuess( position: column, currentSelectedColor: currColor)
    }
    

    
}
