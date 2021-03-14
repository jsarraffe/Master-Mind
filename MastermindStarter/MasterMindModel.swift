
//
//  MasterMindModel.swift
//  MastermindStarter
//
//  Created by Jacques Sarraffe on 3/6/21.
//
import Foundation

struct MasterMindModel{
    
    let maxRows = 8
    var guessRows = [[Int]]()
    var currlevel: Int = 1
    var colors :[Int] = []
    var solutions: [Int] = []
    var didWin: Bool = false
    var showSolution: Bool = false
    
    var maxAttempts = false
    
    var feedBack: [(red: Int, clear: Int)] = []
    
    static var sharedModel = MasterMindModel()
   

    
    init() {
        
        didWin = false
        colors = [0,1,2,3,4,5,6,7]
        currlevel = 1
        guessRows = []
        
        for i in 0..<currlevel{
            guessRows.append([])
            feedBack.append((0,0))
            for _ in 0..<4{
                guessRows[i].append(7)
            
            }
        }
        self.solutions = randomGoal()
    }
    mutating func populateGuess(position: Int, currentSelectedColor: Int){
        
        guessRows[currlevel-1][position] = currentSelectedColor
        printGuessRow()
    
        if isLevelFull() && currlevel < 9{
            
            feedBack[currlevel-1] = checkGuess()
            currlevel += 1
    
                guessRows.append([])
                feedBack.append((0,0))
                for _ in 0..<4{
                    guessRows[currlevel-1].append(7)
                    
                
            }
        }else if isLevelFull() && currlevel >= 9{
            maxAttempts = true
        }
    }
    
    
    func printGuessRow(){
        print(guessRows)
    }
    
    
    func isLevelFull() -> Bool{
        
        return !guessRows[currlevel-1].contains(7)
        
        
    }
    
   func getLevelColors() ->[Int]{
    return guessRows[currlevel-1]
    
   }
    
    
    
    func randomGoal() -> [Int]{
        var randomColors: [Int] = []
        
        for _ in 0..<4{
            randomColors.append(Int.random(in: 0...6))
        }
        return randomColors
    }

    mutating func checkGuess() -> (Int, Int){
        
        var red: Int = 0
        var clear: Int = 0
        var temp : [Int] = guessRows[currlevel-1]
        
        for i in 0..<guessRows[currlevel-1].count{
            if guessRows[currlevel-1][i] == solutions[i] {
                red += 1
                temp[i] = 7
            }
            else{
                if guessRows[currlevel-1].contains(solutions[i]){
                    clear += 1
                    
                    temp[temp.firstIndex(of: solutions[i])!] = 7
                }
            }
            if red >= 4{
                self.didWin = true
            }
            print(didWin)
        }
        return (red, clear)
        
    }
    
    
    mutating func checkGuessd() -> (Int, Int){
        
        var red: Int = 0
        var clear: Int = 0
        
        for i in 0..<guessRows[currlevel-1].count{
            if guessRows[currlevel-1][i] == solutions[i] {
                red += 1
            }
            else{
                if solutions.contains(guessRows[currlevel-1][i]){
                    clear += 1
                }
            }
            if red >= 4{
                self.didWin = true
            }
            print(didWin)
        }
        return (red, clear)
        
    }


 
}
