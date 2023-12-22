
import SwiftUI

class SetGameViewModel: ObservableObject {
    @Published private var model: CardGame<CardContent> = SetGameViewModel.createSetGame()

    var cards: Array<CardGame<CardContent>.Card> {
        model.cards
    }

    func selectCard(at index: Int) {
        model.selectCard(at: index)
    }

    private static func createSetGame() -> CardGame<CardContent> {
        let allCards = [
            CardContent(color: .red, shape: .diamond, filler: .solid, numberOfShapes: 1),
            CardContent(color: .green, shape: .oval, filler: .striped, numberOfShapes: 2),
            CardContent(color: .blue, shape: .squiggle, filler: .open, numberOfShapes: 3),
            CardContent(color: .red, shape: .oval, filler: .open, numberOfShapes: 3),
            CardContent(color: .green, shape: .diamond, filler: .solid, numberOfShapes: 1)
            // Add more combinations as desired
        ]

        return CardGame<CardContent>(numberOfCards: allCards.count) { index in
            allCards[index]
        }
    }

}
