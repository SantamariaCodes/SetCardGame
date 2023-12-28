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
        print("selectCard called for index \(index)") // Debug print

        if let selectedIndices = indicesOfSelectedCards(), selectedIndices.count == 3 {
            let selectedCards = selectedIndices.map { cards[$0] }
            if isSet(cards: selectedCards) {
                print("Set found! \(selectedCards.map { $0.content})")
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
        print("Set found")

        let distinctColors = Set(cards.map { $0.content.color })
        let distinctShapes = Set(cards.map { $0.content.shape })
        let distinctFills = Set(cards.map { $0.content.filler })
        let distinctNumbers = Set(cards.map { $0.content.numberOfShapes })

        return distinctColors.count != 2 && distinctShapes.count != 2 && distinctFills.count != 2 && distinctNumbers.count != 2
    }

    struct Card: Identifiable {
          var id: Int
          var isSelected = false
          var isMatched = false
          var content: CardContentProtocol
      }
    
}
