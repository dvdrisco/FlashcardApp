//
//  FlashcardListPage.swift
//  DriscollDrewHW6
//
//  Created by Drew Driscoll on 10/22/23.
//

import SwiftUI


enum FlashCardRoute {
    case new
}

struct FlashcardListPage: View {
    @EnvironmentObject var flashcardViewModel: FlashcardViewModel
    
    //$ because we're allowing this list to be changed //allowing array to be changed in child view
    // for each flashcard --> provide it a link -> and display it according to FlashcardCell View
    // once the user presses any Flashcard in flashcards-->
    
    var body: some View {
        NavigationStack{
            List($flashcardViewModel.flashcards, editActions: .delete) { $flashcard in
                NavigationLink(value: flashcard){
                    // does this count as a label?
                    FlashcardCell(flashcard: flashcard)
                }
            }
            .navigationDestination(for: FlashCard.self) {
                flashCard in EditFlashCardPage(flashcard:flashCard)
                
            // does the name of these variables matter?
                 // navigationLink vs navigationDestination for Q above
              //  $flashCard // what is this code above doing?
            }
            .navigationTitle("Flashcards")
            .toolbar {
                NavigationLink(value: FlashCardRoute.new) {
                    Image(systemName: "plus")
                }
                .navigationDestination(for: FlashCardRoute.self, destination: { flashcard in
                    if flashcard == FlashCardRoute.new {
                        EditFlashCardPage()
                    }
                    //.self?
                })
               
            }
        }
    }
    
    struct FlashcardListPage_Previews: PreviewProvider {
        static var previews: some View {
            NavigationStack {
                FlashcardListPage()
                    .environmentObject(FlashcardViewModel())
            }
            
        }
    }
}




//What we did before: (not good)
//Is this type of navigation link ok?
//                NavigationLink(destination: EditFlashCardPage(flashcard: nil)){
//                   //does this count as an image?
//
//                    }
//                }
