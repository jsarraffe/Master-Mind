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
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Circle()
                    .stroke(lineWidth: 1.0)
                    .frame(width: diameter, height: diameter, alignment: .leading)
                Circle()
                    .stroke(lineWidth: 1.0)
                    .frame(width: diameter, height: diameter, alignment: .trailing)
            }
            HStack {
                Circle()
                    .stroke(lineWidth: 1.0)
                    .frame(width: diameter, height: diameter, alignment: .leading)
                Circle()
                    .stroke(lineWidth: 1.0)
                    .frame(width: diameter, height: diameter, alignment: .trailing)

            }
        }
    }
}
