//
//  DriscollDrewHW6App.swift
//  DriscollDrewHW6
//
//  Created by Drew Driscoll on 10/22/23.
//

import SwiftUI

@main
struct DriscollDrewHW6App: App {
    var body: some Scene {
        WindowGroup {
            MainTabView(flashcardViewModel: FlashcardViewModel())
        }
    }
}


/*
 Questions:
 is it ok if my preview is not updating the Flashcards values?
 works when i make the app but not in the preview
 values of cards are not automatically updated?
 
 
 
 
 
 // do the name of these variables matter? $flashCard
 List($flashcardViewModel.flashcards, editActions: .delete) { $flashcard in
     NavigationLink(value: flashcard){
         // does this count as a label?
         
         FlashcardCell(flashcard: flashcard)
     // for each flashcard --> provide it a link -> and display it according to FlashcardCell View
     }
 }
 .navigationDestination(for: FlashCard.self) {
     // do the name of these variables matter? $flashCard
     // what is this code above doing?
     flashCard in EditFlashCardPage(flashcard: flashCard)
     // once the user presses any Flashcard in flashcards-->
 }
 .navigationTitle("Flashcards")
 .toolbar {
     //Is this type of navigation link ok?
     NavigationLink(destination: EditFlashCardPage(flashcard: nil)){
        //does this count as an image?
         Image(systemName: "plus")
         }
     }
 }
 */
