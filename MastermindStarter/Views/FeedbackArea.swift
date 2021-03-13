//
//  FeedbackArea.swift
//  MastermindStarter
//
//  Created by Ali A. Kooshesh on 3/3/21.
//

import SwiftUI

struct FeedbackArea: View {
    let length: CGFloat
    
    var diameter: CGFloat {
        length / CGFloat(5.0)
    }
    
    @ObservedObject var viewModel = MasterMindViewModel.sharedView
    
    var row: Int
    
    var body: some View {
        
        if row < viewModel.model.currlevel{
            getColorRows()
            
        }
       
    }
    
    func getColorRows() -> some View{
        
        var cols : [Color] = []
        
       
        for _ in 0..<viewModel.model.feedBack[row].red{
            cols.append(.red)
        }
        for _ in 0..<viewModel.model.feedBack[row].clear{
            cols.append(.white)
        }
        
        if cols.count<4{
            for _ in cols.count..<4{
                cols.append(.clear)
            }
        }
        
        return
            VStack(alignment: .leading) {
  
                HStack() {
                    
                    if cols[0] != .clear{
                        Circle()
                            .stroke(lineWidth: 1.0)
                            .frame(width: diameter, height: diameter, alignment: .leading)
                            .background(cols[0])
    
                    }
                    
                    if cols[1] != .clear{
                        Circle()
                            .stroke(lineWidth: 1.0)
                            .frame(width: diameter, height: diameter, alignment: .leading)
                            .background(cols[1])
    
                    }
                }
                HStack {
                    if cols[2] != .clear{
                        Circle()
                            .stroke(lineWidth: 1.0)
                            .frame(width: diameter, height: diameter, alignment: .leading)
                            .background(cols[2])
                    
                    }
                    if cols[3] != .clear{
                        Circle()
                            .stroke(lineWidth: 1.0)
                            .frame(width: diameter, height: diameter, alignment: .leading)
                            .background(cols[3])
                    
                    }
                    

                }
            }
           
    }
    
    
    
}
