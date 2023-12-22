import Foundation

struct CardGame<CardContent> where CardContent: Hashable {
    
    private(set) var cards: [Card]

    init(numberOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for index in 0..<numberOfCards {
            let content = createCardContent(index)
            cards.append(Card(id: index, content: content))
        }
    }
    
    mutating func selectCard(at index: Int) {
        if let selectedIndices = indicesOfSelectedCards(), selectedIndices.count == 3 {
            let selectedCards = selectedIndices.map { cards[$0] }
            if isSet(cards: selectedCards) {
                selectedIndices.forEach { cards[$0].isMatched = true }
            }
            cards.indices.forEach { cards[$0].isSelected = false }
        }
        cards[index].isSelected.toggle()
    }

     func indicesOfSelectedCards() -> [Int]? {
        let selectedIndices = cards.indices.filter { cards[$0].isSelected && !cards[$0].isMatched }
        return selectedIndices.count > 0 ? selectedIndices : nil
    }

     func isSet(cards: [Card]) -> Bool {
        guard cards.count == 3 else { return false }
        let distinctContents = Set(cards.map { $0.content })
        return distinctContents.count != 2
    }

    struct Card: Identifiable {
        var id: Int
        var isSelected = false
        var isMatched = false
        var content: CardContent
    }
}
