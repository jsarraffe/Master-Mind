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
    var currlevel: Int = 1
    var colors :[Int] = []
    var solutions: [Int] = []
    
    var currentSelectedColor: Int  = 1
    
    func getColor()->Int{return self.currentSelectedColor }
    mutating func setColor(newVal: Int){self.currentSelectedColor = newVal }
    
    var currentLevel: Int {
        get {return currlevel}
        set {currlevel = newValue}
    }
    

    
    init() {
        
        colors = [0,1,2,3,4,5,6,7]
        currentLevel = currlevel
        
        for i in 0..<currlevel{
            guessRows.append([])
            for _ in 0..<4{
                guessRows[i].append(7)
            }
        }
        self.solutions = randomGoal()
    }
    mutating func populateGuess(position: Int){
        
        guessRows[currentLevel-1][position] = currentSelectedColor
        print(position)
    }
    
    
    func printGuessRow(){
        print(guessRows)
    }
    
    
    
    var guesses: [Int] = []
   mutating func getLevelColors() ->[Int]{
    guesses = []
        for i in 0..<4{
            guesses.append(guessRows[currentLevel-1][i])
        }
    return guesses
    
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
    
   
    
    enum Colors {
        case blue, yellow, purple, red, green, black, gray, clear
            
    }
}

