
import SwiftUI

class SetGameViewModel: ObservableObject {
    // this needs to be changed if im not mistaken
    @Published private var model: CardGame<CardContent> = SetGameViewModel.createSetGame()

    var cards: Array<CardGame<CardContent>.Card> {
        model.cards
    }

    func selectCard(at index: Int) {
        model.selectCard(at: index)
    }

    private static func createSetGame() -> CardGame<CardContent> {
        let allCards = [
            CardContent(color: .red, shape: .squiggle, numberOfShapes: 3, filler: .unfilled),
            CardContent(color: .blue, shape: .diamond, numberOfShapes: 2, filler: .unfilled),
            CardContent(color: .green, shape: .oval, numberOfShapes: 1, filler: .unfilled),
            CardContent(color: .red, shape: .diamond, numberOfShapes: 1, filler: .solid),
            CardContent(color: .red, shape: .squiggle, numberOfShapes: 2, filler: .unfilled),
            CardContent(color: .blue, shape: .diamond, numberOfShapes: 1, filler: .solid),
            CardContent(color: .green, shape: .oval, numberOfShapes: 1, filler: .solid),
            CardContent(color: .red, shape: .diamond, numberOfShapes: 1, filler: .solid),
            CardContent(color: .red, shape: .squiggle, numberOfShapes: 2, filler: .unfilled),
            CardContent(color: .blue, shape: .diamond, numberOfShapes: 1, filler: .solid),
            CardContent(color: .green, shape: .diamond, numberOfShapes: 1, filler: .solid),
            CardContent(color: .red, shape: .diamond, numberOfShapes: 1, filler: .solid),
            CardContent(color: .red, shape: .squiggle, numberOfShapes: 2, filler: .unfilled),
            CardContent(color: .blue, shape: .diamond, numberOfShapes: 1, filler: .solid),
            CardContent(color: .green, shape: .diamond, numberOfShapes: 1, filler: .solid),
            CardContent(color: .red, shape: .diamond, numberOfShapes: 1, filler: .solid),
            CardContent(color: .red, shape: .squiggle, numberOfShapes: 1, filler: .solid),
            CardContent(color: .red, shape: .squiggle, numberOfShapes: 1, filler: .solid),
            CardContent(color: .red, shape: .oval, numberOfShapes: 1, filler: .solid),
            CardContent(color: .red, shape: .diamond, numberOfShapes: 1, filler: .solid),

            
        ]
        return CardGame<CardContent>(numberOfCards: allCards.count) { index in
            allCards[index]
        }
    }

}
