//
//  ContentView.swift
//  TextSync
//
//  Created by Calin Ciubotariu on 12/04/2020.
//  Copyright © 2020 Calin Ciubotariu. All rights reserved.
//

import SwiftUI

// 3
class ContentViewModel: ObservableObject {
    @Published var textValue: String = "Hello"
    @Published var enteredTextValue: String = "" {
        didSet {
            textsMatch = (enteredTextValue == textValue)
        }
    }
    @Published var textsMatch: Bool = false
}

struct ContentView: View {
    
    // 1 and 2
//    @State var textValue: String = "Hello"
//    @State var enteredTextValue: String = ""
//    @State var textsMatch: Bool = false
    
    // 1
//    func checkIfTextsMatch(changed: Bool) {
//        self.textsMatch = self.textValue == self.enteredTextValue
//    }
    
    // 2
//    func checkIfTextsMatch() {
//        self.textsMatch = self.textValue == self.enteredTextValue
//    }
    
    
    // 3
    @ObservedObject var viewModel = ContentViewModel()
    
    var body: some View {
        // 3
        VStack {
            HStack {
                Text("Write this word: ")
                Text(String(viewModel.textValue))
            }

            TextField("Write here:", text: $viewModel.enteredTextValue)
                .padding(10)
                .border(Color.green, width: 1)
            Text(viewModel.enteredTextValue)

            Toggle(isOn: $viewModel.textsMatch) {
                Text("Matching?")
            }
            .disabled(true)
            .padding()
        }.padding()
//
        // 2
//        let textValueBinding = Binding<String>(get: {
//            self.enteredTextValue
//        }, set: {
//            self.enteredTextValue = $0
//            self.checkIfTextsMatch()
//        })
//
//        return VStack {
//            HStack {
//                Text("Write this word: ")
//                Text(String(textValue))
//            }
//
//            TextField("Write here:", text: textValueBinding)
//                .padding(10)
//                .border(Color.green, width: 1)
//            Text(enteredTextValue)
//
//            Toggle(isOn: $textsMatch) {
//                Text("Matching?")
//            }
//            .disabled(true)
//            .padding()
//        }.padding()
        
        // 1
//                VStack {
//                    HStack {
//                        Text("Write this word: ")
//                        Text(textValue)
//                    }
//
////                    TextField("Write here:", text: $enteredTextValue)
////                        .padding(10)
////                        .border(Color.green, width: 1)
////                    Text(enteredTextValue)
//
//                    TextField("Write here:",
//                              text: $enteredTextValue,
//                              onEditingChanged: self.checkIfTextsMatch)
//                        .padding(10)
//                        .border(Color.green, width: 1)
////                    Text(String(textsMatch))
//
//                                Toggle(isOn: $textsMatch) {
//                                    Text("Matching?")
//                                }
//                                .disabled(true)
//                                .padding()
//            }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
