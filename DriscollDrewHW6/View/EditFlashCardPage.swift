//
//  EditFlashCardPage.swift
//  DriscollDrewHW6
//
//  Created by Drew Driscoll on 10/22/23.
//

import SwiftUI


struct EditFlashCardPage: View, Hashable, Equatable {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var flashcardViewModel: FlashcardViewModel
    private var flashcard: FlashCard?
    @State private var question = ""
    @State private var answer = ""
    @State private var isFavorite = false
    
    static func == (lhs: EditFlashCardPage, rhs: EditFlashCardPage) -> Bool {
        return lhs.flashcard == rhs.flashcard &&
                       lhs.question == rhs.question &&
                       lhs.answer == rhs.answer &&
                       lhs.isFavorite == rhs.isFavorite
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(flashcard)
        hasher.combine(question)
        hasher.combine(answer)
        hasher.combine(isFavorite)
    }
    
    //Does my code make sense here?
    init(flashcard: FlashCard? = nil){
        if let initFlashcard = flashcard {
            self.flashcard = initFlashcard
            _question=State(initialValue: initFlashcard.question)
            _answer=State(initialValue: initFlashcard.answer)
            _isFavorite=State(initialValue: initFlashcard.isFavorite)
        }
    }
    
    var body: some View {
        VStack(spacing: 24){
            TextField("Question", text: $question)
            TextField("Answer", text: $answer)
            Toggle("Is Favorite?", isOn: $isFavorite)
            Spacer()
        }
        .padding()
        .navigationTitle((flashcard != nil) ? "Edit Card" : "New Card")
        // this needs to be wrapped in NavigationView to work + toolbars
        // make sure this is correct?
        .toolbar{
            ToolbarItem(){
                Button("Save"){
                    
                    if flashcard != nil {
                        flashcardViewModel.update(flashcard: FlashCard(id: flashcard!.id, question: question, answer: answer, isFavorite: isFavorite), at: flashcardViewModel.getIndex(for: flashcard!)!)
                    }
                    else{
                        flashcardViewModel.append(flashcard: FlashCard(id: UUID().uuidString, question: question, answer: answer, isFavorite: isFavorite))
                    }
                    dismiss()
                }
                .disabled(question.isEmpty || answer.isEmpty)
                
            }
        }
        
    }
}

struct EditFlashCardPage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            EditFlashCardPage(flashcard: nil)
           
            //EditFlashCardPage(flashcard: FlashCard(id: "sdfsdfasdf", question: "Shit", answer: "Si", isFavorite: false))
        }
        
    }
}
