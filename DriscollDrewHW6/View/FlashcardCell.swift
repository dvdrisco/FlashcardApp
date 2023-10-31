//
//  FlashcardCell.swift
//  DriscollDrewHW6
//
//  Created by Drew Driscoll on 10/22/23.
//

import SwiftUI

struct FlashcardCell: View {
    let flashcard: FlashCard
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12){
            Text(flashcard.question)
                .font(.title3)
            Text(flashcard.answer)
                .font(.subheadline)
        }
    }
}

struct FlashcardCell_Previews: PreviewProvider {
    // why can't i use this? 
    static var previews: some View {
        FlashcardCell(flashcard: FlashCard(id: "dsdf", question: "sdf", answer: "sdf", isFavorite: false))
    }
}
