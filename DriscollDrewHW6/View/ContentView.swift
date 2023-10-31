//
//  ContentView.swift
//  DriscollDrewHW6
//
//  Created by Drew Driscoll on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainTabView(flashcardViewModel: FlashcardViewModel())
    }
    // we put contentView --> FlashcardPage?
    // is this what it means when it says Update ContentView? 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
