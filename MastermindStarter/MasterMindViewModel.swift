//
//  MasterMindViewModel.swift
//  MastermindStarter
//
//  Created by Jacques Sarraffe on 3/6/21.
//

import Foundation

class MasterMindViewModel: ObservableObject{
     
    
    @Published var theModel = MasterMindModel()

    @Published var currentSelectedColor: Int = 0
    
    
    static var shared = MasterMindModel()
    
    static var sharedView = MasterMindViewModel()

    
    func guess(column : Int) {
    
//theModel.populateGuess( position: column)
    }
    
 

    enum Colors {
        case blue, yellow, purple, red, green, black, gray
            
    }
    
}
