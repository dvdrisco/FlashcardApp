//
//  FlashcardViewModel.swift
//  DriscollDrewHW6
//
//  Created by Drew Driscoll on 10/22/23.
//

import SwiftUI
import Combine

class FlashcardViewModel: FlashcardsModel, ObservableObject{
    private var flashcardsFilePath: URL
    
    @Published var flashcards = [FlashCard](){ // setting it equal to an empty array to allow functions to be called in the init()
        didSet{
            save()
        }
    }
     
    @Published var currentIndex: Int = 0{
        didSet {
            if currentIndex >= flashcards.count || currentIndex < 0 {
                currentIndex=0
            }
        }
    }
    
    var numberOfFlashcards: Int {
        return flashcards.count
    }
    
     var currentFlashcard: FlashCard? {
        if flashcards.isEmpty{
            return nil
        }
        else{
            return flashcards[currentIndex]
        }
    }
    
    var favoriteFlashcards: [FlashCard] {
        // Use filter to create a new array containing elements with favorite set to true
        return flashcards.filter{favorite in
            favorite.isFavorite==true}
    }
    
    init() {
        let documentsDirectory = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask).first!
        let filePath = ("\(documentsDirectory)/flashcards.json")
        print(filePath)
        flashcardsFilePath = URL(string: filePath)!
        
        if let loadedFlashcards = load(){
            self.flashcards = loadedFlashcards
        } else{
            self.flashcards = [
                FlashCard(id: UUID().uuidString, question: "GOAT of Tennis?", answer: "Sadly, Novak", isFavorite: false),
                FlashCard(id: UUID().uuidString, question: "Number of rings Lebron has? ", answer: "4", isFavorite: false),
                FlashCard(id: UUID().uuidString, question: "GOAT of MMA?", answer: "Mcgregor", isFavorite: false),
                FlashCard(id: UUID().uuidString, question: "Goat of Football?", answer: "Brady", isFavorite: false),
                FlashCard(id: UUID().uuidString, question: "What color is the moon?", answer: "white", isFavorite: false)
            ]
        }
        randomize()
    }
    
    

    
    
    
    private func load()-> [FlashCard]? {
        let decoder = JSONDecoder()
        do{
            let data = try Data(contentsOf: flashcardsFilePath)
            let flashcards = try decoder.decode(Array <FlashCard>.self, from: data)
            return flashcards
        }
        catch{
            print(error)
            return nil
        }
    }
    
    
    
    private func save(){
        let encoder = JSONEncoder()
        do{
            let data = try encoder.encode(flashcards)
            try data.write(to: flashcardsFilePath)
        }
        catch{
            print(error)
        }
    }
    
    
    func randomize() {
        var randomIndex = Int.random(in: 0..<flashcards.count)
        while randomIndex == currentIndex{
            randomIndex = Int.random(in: 0..<flashcards.count)
        }
        currentIndex = randomIndex
    }
    
    func next() {
        if currentIndex < flashcards.count-1{
            currentIndex+=1
        }
        else{
            currentIndex=0
        }
    }
    
    func previous() {
        if currentIndex > 0{
            currentIndex-=1
        }
        else{
            currentIndex=flashcards.count-1
        }
    }
   
    func indexCheck(index: Int)-> Int?{
        guard index>=0 && index<flashcards.count else{
            return nil
        }
        return index
    }
    
       
    
    func flashcard(at index: Int) -> FlashCard? {
        return flashcards[indexCheck(index: index)!]
        // correct?
        // created a function so I didn't have to check the index everytime.
    }
    
    func append(flashcard: FlashCard) {
        flashcards.append(flashcard)
    }
    
    func insert(flashcard: FlashCard, at index: Int) {
        if let correctIndex = indexCheck(index: index) {
            flashcards.insert(flashcard, at: correctIndex)
        }
        else{
            flashcards.append(flashcard)
        }
    }
        
    func removeFlashcard(at index: Int) {
        guard let correctIndex = indexCheck(index: index) else{
            return //?
        }
        flashcards.remove(at: correctIndex)
    }
    
    func getIndex(for flashcard: FlashCard) -> Int? {
        guard let index = flashcards.firstIndex(of: flashcard) else{
            return nil
        }
        return index
    }
    
    func update(flashcard: FlashCard, at index: Int) {
        guard let correctIndex = indexCheck(index: index) else{
            return
        }
        flashcards[correctIndex] = flashcard
        save()
        
        
    }
    
    func toggleFavorite() {
        let favorite: Bool
        guard let flashcard = currentFlashcard else{
            return
        }
        if flashcard.isFavorite == true{
            favorite = false
        } else{
            favorite = true
        }
        
        let updatedFlashcard = FlashCard(id: flashcard.id, question: flashcard.question, answer: flashcard.answer, isFavorite: favorite)
        update(flashcard: updatedFlashcard, at: currentIndex)
    }
}

