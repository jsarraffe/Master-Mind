//
//  MasterMindModel.swift
//  MastermindStarter
//
//  Created by Jacques Sarraffe on 3/6/21.
//

import Foundation

struct MasterMindModel{
    
    let maxRows = 9
    var guessRows = [[Int]]()
    var currlevel: Int = 0
    var colors :[Int:String]
    var solutions: [Int] = []
    

    
    init() {
        
        colors = [1:"Blue",2:"Yello",3:"Purple",4:"Red",5:"Green",6:"Black",7:"Grey", 8:"Clear"]
        
        for i in 0..<currlevel{
            guessRows.append([i])
            for _ in 0..<4{
                guessRows[i].append(8)
            }
        }
        self.solutions = randomGoal()
        
        
        
    }
    mutating func populateGuess(color: Int, position: Int){
        guessRows[currlevel][position] = color
    }
    
    func randomGoal() -> [Int]{
        var randomColors: [Int] = []
        
        for _ in 0..<4{
            randomColors.append(Int.random(in: 1...7))
        }
        return randomColors
    }
    
    func checkGuess() -> (Int, Int){
        
        var red: Int = 0
        var clear: Int = 0
        
        for i in guessRows[currlevel]{
            if guessRows[currlevel][i] == solutions[i] {
                red += 1
            }
            else{
                if solutions.contains(guessRows[currlevel][i]){
                    clear += 1
                }
            }

        }
        return (red, clear)
        
    }
}

