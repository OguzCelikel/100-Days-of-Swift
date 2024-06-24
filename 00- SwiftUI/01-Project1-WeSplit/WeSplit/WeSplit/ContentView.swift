//
//  ContentView.swift
//  WeSplit
//
//  Created by Ömer Oğuz Çelikel on 24.06.2024.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"

    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        // SwiftUI needs to be able to identify every view on the screen uniquely, so it can detect when things change.
                        // if we rearranged our array so that Ron came first, SwiftUI would move its text view at the same time.
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
