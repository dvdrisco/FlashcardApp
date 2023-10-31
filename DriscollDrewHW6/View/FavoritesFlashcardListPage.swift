//
//  FavoritesFlashcardListPage.swift
//  DriscollDrewHW6
//
//  Created by Drew Driscoll on 10/23/23.
//

import SwiftUI

struct FavoritesFlashcardListPage: View {
    @EnvironmentObject var flashcardViewModel: FlashcardViewModel
    
    var body: some View {
        NavigationStack{
            List(flashcardViewModel.favoriteFlashcards){
                flashcard in
                NavigationLink(value: flashcard){
                    FlashcardCell(flashcard: flashcard)
                }
            }
            .navigationDestination(for: FlashCard.self){
                flashcard in EditFlashCardPage(flashcard: flashcard)
            }
            .navigationTitle("Favorites")
           
        }
        
    }
}

struct FavoritesFlashcardListPage_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesFlashcardListPage()
            .environmentObject(FlashcardViewModel())
    }
}
