//
//  MasterMindViewModel.swift
//  MastermindStarter
//
//  Created by Jacques Sarraffe on 3/6/21.
//

import Foundation

class MasterMindViewModel: ObservableObject{
    
    
    
    @Published var MasterMindViewModel = MasterMindModel()

    @Published var currentSelectedColor: Int = 0
    
    
  
}
