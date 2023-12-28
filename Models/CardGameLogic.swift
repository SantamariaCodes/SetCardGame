struct CardGame<CardContent> where CardContent: Hashable {
    
    private(set) var cards: [Card]

    init(numberOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for index in 0..<numberOfCards {
            let content = createCardContent(index)
            cards.append(Card(id: index, content: content as! CardContentProtocol))
        }
    }
    
    mutating func selectCard(at index: Int) {
        // Toggle selection state for the current card
        cards[index].isSelected.toggle()

        // Check if three cards are selected
        if let selectedIndices = indicesOfSelectedCards(), selectedIndices.count == 3 {
            let selectedCards = selectedIndices.map { cards[$0] }
            
            if isSet(cards: selectedCards) {
                print("Set found! \(selectedCards.map { $0.content})")
                // Mark the selected cards as matched
                selectedIndices.forEach { cards[$0].isMatched = true }
            }

            // Deselect all cards (whether they form a set or not)
            cards.indices.forEach { cards[$0].isSelected = false }
        }
    }


    func indicesOfSelectedCards() -> [Int]? {
        let selectedIndices = cards.indices.filter { cards[$0].isSelected && !cards[$0].isMatched }
        return selectedIndices.count > 0 ? selectedIndices : nil
    }

    func isSet(cards: [Card]) -> Bool {
        guard cards.count == 3 else { return false }
        print("Set found")

        let distinctColors = Set(cards.map { $0.content.color })
        let distinctShapes = Set(cards.map { $0.content.shape })
        let distinctFills = Set(cards.map { $0.content.filler })
        let distinctNumbers = Set(cards.map { $0.content.numberOfShapes })

        return distinctColors.count != 2 && distinctShapes.count != 2 && distinctFills.count != 2 && distinctNumbers.count != 2
    }

    struct Card: Identifiable, Equatable {
        static func == (lhs: CardGame<CardContent>.Card, rhs: CardGame<CardContent>.Card) -> Bool {
            lhs.id == rhs.id && lhs.isSelected == rhs.isSelected && lhs.isMatched == rhs.isMatched

        }
        
          var id: Int
          var isSelected = false
          var isMatched = false
          var content: CardContentProtocol
      }
    
}
