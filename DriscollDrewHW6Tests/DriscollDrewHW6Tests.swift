//
//  DriscollDrewHW6Tests.swift
//  DriscollDrewHW6Tests
//
//  Created by Drew Driscoll on 10/22/23.
//

import XCTest
@testable import DriscollDrewHW6

final class DriscollDrewHW5Tests: XCTestCase {
    var viewModel: FlashcardViewModel!
    
    override class func setUp() {
    }

    // Invoked EVERY TIME per test case
    override func setUp() {
        // 1. Setup
        viewModel = FlashcardViewModel()
    }
     
    func testCurrentIndex(){
       let currentIndex = viewModel.currentIndex
        
            XCTAssertLessThanOrEqual(currentIndex, viewModel.flashcards.count-1)
            XCTAssertGreaterThanOrEqual(currentIndex, 0)
        }
    func testCurrentFlashcard(){
        let currentFlashcard = viewModel.currentFlashcard
        XCTAssertNotNil(currentFlashcard)
        
    }
    
    func testRandomize(){
        let priorFlashcard = viewModel.currentFlashcard
        viewModel.randomize()
        let randomFlashcard = viewModel.currentFlashcard
        
        XCTAssertNotNil(randomFlashcard)
        XCTAssertNotEqual(priorFlashcard, randomFlashcard)
    }
    
    func testNext(){
        let priorFlashcard = viewModel.currentFlashcard
        viewModel.next()
        let nextFlashcard = viewModel.currentFlashcard
        
        XCTAssertNotNil(nextFlashcard)
        XCTAssertNotEqual(priorFlashcard, nextFlashcard)
    }
    
    func testPrevious(){
        let flashcard = viewModel.currentFlashcard
        viewModel.previous()
        let previousFlashcard = viewModel.currentFlashcard
        
        XCTAssertNotNil(previousFlashcard)
        XCTAssertNotEqual(flashcard, previousFlashcard)
    }
    
    func testIndexCheck(){
        let flashcard = viewModel.currentFlashcard
        XCTAssertNil(viewModel.indexCheck(index: -7))
    }
    
    func testGetIndex(){
        let flashcard = FlashCard(id: "1", question: "hello", answer: "", isFavorite: true)
        viewModel.append(flashcard: flashcard)
        
        // 2. Operation
        let index = viewModel.getIndex(for: flashcard)
        
        // 3. Assertion
        XCTAssertEqual(viewModel.numberOfFlashcards-1, index)
    }
    
    func testAppendFlashcard(){
        let flashcardCountBefore = viewModel.numberOfFlashcards
        // 2. Operation
        viewModel.append(flashcard: FlashCard(id: "2", question: "", answer: "", isFavorite: true))
        // 3. Assertion
        let flashcardCountAfter = viewModel.numberOfFlashcards
        XCTAssertEqual(flashcardCountBefore + 1, flashcardCountAfter)
    }
    
    func testInsert(){
        let flashcard = FlashCard(id: "3", question: "yo", answer: "", isFavorite: true)
        viewModel.insert(flashcard: flashcard, at: 3)
        
        // 2. Operation
        let index = viewModel.getIndex(for: flashcard)
        
        // 3. Assertion
        XCTAssertEqual(3, index)
    }
    
    func testRemove(){
        let flashcardCountBefore = viewModel.numberOfFlashcards
        
        // 2. Operation
         viewModel.removeFlashcard(at: 3)
        let flashcardCountAfter = viewModel.numberOfFlashcards
        // 3. Assertion
        XCTAssertEqual(flashcardCountBefore-1, flashcardCountAfter)
    }
    
    
    func testUpdate(){
        let flashcardBefore = viewModel.flashcards[0]
        // 2. Operation
        let flashcardAfter = FlashCard(id: "7", question: "", answer: "", isFavorite: true)
         viewModel.update(flashcard: flashcardAfter, at: 0)
        // 3. Assertion
        XCTAssertNotEqual(flashcardBefore, flashcardAfter)
    }
    
    func testToggleFavorite(){
        let numberFavoriteFlashcardBefore = viewModel.favoriteFlashcards.count
        
        
        // 2. Operation
        while viewModel.currentFlashcard!.isFavorite{
            viewModel.randomize()
        }
        viewModel.toggleFavorite()
        
        let numberFavoriteFlashcardAfter = viewModel.favoriteFlashcards.count
        
        // 3. Assertion
        XCTAssertEqual(numberFavoriteFlashcardBefore+1, numberFavoriteFlashcardAfter)
    }
    
    
    /*
    func testfavoriteFlashcards(){
        viewModel.append(flashcard: FlashCard(id: "1", question: "?", answer: "", isFavorite: true))
        let favoriteFlashcards = viewModel.favoriteFlashcards
        XCTAssertEqual(favoriteFlashcards, viewModel.favoriteFlashcards)
    }
     */
    
    /*
     Questions?
     What is this code doing?
     
    struct QuoteListNavContiainer: View {

        var body: some View {
            NavigationStack {
                QuotesListPage()
                    .navigationDestination(for: QuoteRoute.self) {
                        if $0 == QuoteRoute.new {
                            NewQuotePage()
                    }
                }
            }
        }
    }
     */

/*
 
 This code is in the Quote generator:
 
 .toolbar {
     // Approach #1
     NavigationLink(value: QuoteRoute.new) {
         Image(systemName: "plus")
     }
     // where is the destination?
 
 import SwiftUI

 struct QuotesListPage: View {
     @EnvironmentObject var viewModel: QuoteViewModel

     var body: some View {
         List($viewModel.quotes, editActions: .delete) { $quote in
             QuoteRow(quote: quote)
         }
         .navigationTitle("Quotes")
         .toolbar {
             // Approach #1
             NavigationLink(value: QuoteRoute.new) {
                 Image(systemName: "plus")
             }
             // where is the destination?
             
 //                // Approach #2: Don't do this
 //                NavigationLink {
 //                    NewQuotePage()
 //                } label: {
 //                    Image(systemName: "plus")
 //                }
         }
     }
 }

 #Preview {
     NavigationStack {
         QuotesListPage()
             .environmentObject(QuoteViewModel())
     }
 }

 */
    
    
}

