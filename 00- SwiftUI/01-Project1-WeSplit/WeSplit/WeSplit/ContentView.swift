//
//  ContentView.swift
//  WeSplit
//
//  Created by Ömer Oğuz Çelikel on 24.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    @State private var name = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Enter your name", text: $name) //read and write
                Text("Hello, world!")
                Text(name) // just read
                
                // both are same
                ForEach(0..<20) { number in
                    Text("Row \(number)")
                }
                
                ForEach(0..<20) {
                    Text("Row \($0)")
                }
            }
            Spacer()
            Button("Tap Count: \(tapCount)") {
                tapCount += 1
            }.padding()
                .navigationTitle("Test")
                .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
