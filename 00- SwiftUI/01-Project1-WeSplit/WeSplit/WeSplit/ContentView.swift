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
        Form {
            TextField("Enter your name", text: $name) //read and write
            Text("Hello, world!")
            Text(name) // just read
        }
        Spacer()
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }.padding()
    }
}

#Preview {
    ContentView()
}
