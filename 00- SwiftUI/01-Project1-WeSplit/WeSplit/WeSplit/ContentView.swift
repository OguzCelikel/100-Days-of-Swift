//
//  ContentView.swift
//  WeSplit
//
//  Created by Ömer Oğuz Çelikel on 24.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        // numberOfPeople zaten en az 2 olacak şekilde ayarlandığından direkt kullanılabilir.
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        
        // Bahşiş tutarını hesapla.
        let tipValue = checkAmount / 100 * tipSelection
        // Bahşiş eklenmiş toplam tutarı hesapla.
        let grandTotal = checkAmount + tipValue
        // Kişi başına düşen miktarı hesapla.
        let amountPerPerson = grandTotal / peopleCount
        
        // Kişi başına düşen tutarı geri döndür.
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(0..<20) {
                            Text("\($0) people")
                        }
                    }
                    //.pickerStyle(.navigationLink)
                }
                
                //                Section("How much do you want to tip?") {
                //                    Picker("Tip percentage", selection: $tipPercentage) {
                //                        ForEach(tipPercentages, id: \.self) {
                //                            Text($0, format: .percent)
                //                        }
                //                    }
                //                    .pickerStyle(.segmented)
                //                }
                
                Section("How much do you want to tip?") {
                    NavigationLink(destination: TipSelectionView(tipPercentage: $tipPercentage)) {
                        HStack {
                            Text("Tip percentage")
                            Spacer()
                            Text("\(tipPercentage)%")
                                .foregroundColor(.gray)
                        }
                    }
                }
                
                Section("Total amount of the check") {
                    Text((totalPerPerson * Double(numberOfPeople)), format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            } // Form
            .navigationTitle("WeSplit")
            
            // when keyboard is open in toolbar we can see Done button in toolbar
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
