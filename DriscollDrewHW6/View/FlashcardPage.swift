//
//  FlashcardPage.swift
//  DriscollDrewHW6
//
//  Created by Drew Driscoll on 10/23/23.
//
import SwiftUI

struct FlashcardPage: View {
    let OFFSET_X = 300.0
    let OFFSET_Y = 900.0
    // should be an environment object
    @EnvironmentObject var flashcardViewModel: FlashcardViewModel
    @State var isShowingQuestion = true
    @State var offsetX = 0.0
    @State var offsetY = 0.0
    @State var isHidden = false
    
    var title: String {
        if isShowingQuestion{
            return flashcardViewModel.currentFlashcard?.question ?? ""
        }
        else{
            return flashcardViewModel.currentFlashcard?.answer ?? ""
        }
    }
    
    var isFavorite: Bool {
        // do hw have to make sure currentFlashcard has a value / not nil?
        if flashcardViewModel.currentFlashcard?.isFavorite==true{
            return true
        }
        return false
      }
    
    
    func showRandomFlashCard(){
        //Moves the view to the top edge of the screen.
        withAnimation(.linear(duration: 0.3)){
            isHidden=true
            offsetY = -1 * OFFSET_Y
        }
        //moving the view to the bottom of the screen after waiting 1 second
        withAnimation(.linear.delay(0.3)){
            offsetY=OFFSET_Y
            flashcardViewModel.randomize()
            isShowingQuestion=true
        }
        withAnimation(.easeInOut(duration: 0.3).delay(1)){
            offsetY=0.0
            isHidden=false
        }
    }
    
    func toggleQuestionAnswer(){
        withAnimation{
            isShowingQuestion.toggle()
        }
    }
    
    func showNextCard(){
        withAnimation(.linear(duration: 0.3)){
            isHidden=true
            offsetX = -1 * OFFSET_X
        }
        //moving the view to the bottom of the screen after waiting 1 second
        withAnimation(.linear.delay(0.5)){
            offsetX=OFFSET_X * 2
            isShowingQuestion=true
            flashcardViewModel.next()
            
        }
        withAnimation(.easeInOut(duration: 0.3).delay(1)){
            offsetX=0.0
            isHidden=false
        }
    }
    
    func showPreviousCard(){
        withAnimation(.linear(duration: 0.3)){
            isHidden=true
            offsetX = 1 * OFFSET_X
        }
        //moving the view to the bottom of the screen after waiting 1 second
        withAnimation(.linear.delay(0.5)){
            offsetX=OFFSET_X * -2
            isShowingQuestion=true
            flashcardViewModel.previous()
            
        }
        withAnimation(.easeInOut(duration: 0.3).delay(1)){
            offsetX=0.0
            isHidden=false
        }
    }
    
    var body: some View {
        ZStack{
            VStack{
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(isShowingQuestion ?.red: .blue)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.green)
            .onTapGesture (count: 2) {
                toggleQuestionAnswer()
            }
            .onTapGesture {
                showRandomFlashCard()
            }
            .opacity(isHidden ? 0:1)
            .offset(x: offsetX, y:offsetY)
            .gesture(DragGesture(minimumDistance: 3.0, coordinateSpace: .local)
                .onEnded { value in
                    print(value.translation)
                    switch(value.translation.width, value.translation.height) {
                    case (...0, -30...30):
                        showNextCard()
                        // show next card here
                    case (0..., -30...30):
                        showPreviousCard()
                        // show previous card here
                    case (-100...100, ...0):
                        print("up swipe")
                    case (-100...100, 0...):
                        print("down swipe")
                    default:
                        print("no clue")
                    }
                }
                     
            )
            .padding()
            VStack{
                HStack{
                    Spacer()
                    Button{
                    flashcardViewModel.toggleFavorite()
                       
                    } label:{
                    Image(systemName: "star.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80,height: 60)
                    }
                    .padding()
                }
                .padding()
                .tint(isFavorite ? .yellow: .gray)
                Spacer()
            }
        }
        
        
    }
}

struct FlashcardPage_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardPage()
    }
}
