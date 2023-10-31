//
//  MainTabView.swift
//  DriscollDrewHW6
//
//  Created by Drew Driscoll on 10/23/23.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var flashcardViewModel: FlashcardViewModel
    
    
    var body: some View {
        TabView{
            FlashcardPage()
                .tabItem{
                    Label("Question", systemImage: "questionmark")
                }
            FlashcardListPage()
                .tabItem{
                    Label("Cards", systemImage: "square.stack.3d.up.fill")
                }
            FavoritesFlashcardListPage()
                .tabItem{
                    Label("Favorites", systemImage: "star.fill")
                }
        }
        .environmentObject(flashcardViewModel)
    }
    
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(flashcardViewModel: FlashcardViewModel())
            
    }
}
