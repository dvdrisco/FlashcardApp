//  Flashcard.swift
//  DriscollDrewHW6
//  Created by Drew Driscoll on 10/22/23.
//


import SwiftUI

struct FlashCard: Identifiable, Hashable, Codable {
    let id: String
    let question: String
    let answer: String
    let isFavorite: Bool
    
    func hash(into hasher: inout Hasher){
        hasher.combine(id)
        hasher.combine(question)
        hasher.combine(answer)
        hasher.combine(isFavorite)
    }
    
}
