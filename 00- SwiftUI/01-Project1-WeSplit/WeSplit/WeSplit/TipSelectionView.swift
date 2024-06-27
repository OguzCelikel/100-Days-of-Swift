//
//  TipSelectionView.swift
//  WeSplit
//
//  Created by Ömer Oğuz Çelikel on 27.06.2024.
//

import SwiftUI

struct TipSelectionView: View {
    @Binding var tipPercentage: Int
    
    var body: some View {
        List(0..<101, id: \.self) { percentage in
            Button(action: {
                tipPercentage = percentage
            }) {
                HStack {
                    Text("\(percentage)%")
                    Spacer()
                    if percentage == tipPercentage {
                        Image(systemName: "checkmark")
                    }
                }
            }
        }
        .navigationTitle("Select Tip Percentage")
    }
}

