//
//  FlashcardsModel.swift
//  DriscollDrewHW6
//
//  Created by Drew Driscoll on 10/22/23.
//

import SwiftUI
 
protocol FlashcardsModel{
    var numberOfFlashcards: Int{get}
    var currentFlashcard: FlashCard? {get}
    var favoriteFlashcards: [FlashCard]{get}
    func randomize()
        // randomizes the currentIndex
    
    func next()
        // Set currentIndex to be next
        // if currentIndex reaches the end of array
        // it should loop back to the beginning of array
    
    func previous()
        // Set currentIndex to be previous
        // if currentIndex reaches past the beginning
        // it should loop back to the end of array
    
    func flashcard(at index: Int)-> FlashCard?
        // Returns a flashcard at a given index
    
    func append(flashcard: FlashCard)
        //Initializes flashcard at end of your flashcards array
    
    // Initializes a flashcard at specific index of your flashcards array
    func insert(flashcard: FlashCard, at index: Int)
    
    // Removes flashcard at a specific index
    func removeFlashcard(at index: Int)
    
    // Returns an index for a given flashcard
    func getIndex(for flashcard: FlashCard)-> Int?
    
    // Updates a flashcard at a specific index
    func update(flashcard: FlashCard, at index: Int)
    
    // Toggles the favorite attribute of your flashcard
    func toggleFavorite()
    
}
 


