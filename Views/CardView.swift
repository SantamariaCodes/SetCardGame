import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: SetGameViewModel
    let cardIndex: Int

    var body: some View {
        let card = viewModel.cards[cardIndex]
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 100, height: 150)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(card.isSelected ? Color.blue : Color.gray, lineWidth: card.isSelected ? 3 : 1)
                        .stroke(card.isMatched ? Color.green : Color.gray, lineWidth: card.isSelected ? 3 : 1)

                )
                .onTapGesture {
                    viewModel.selectCard(at: cardIndex)
                }

            VStack(spacing: 10) {
                ForEach(0..<card.content.numberOfShapes, id: \.self) { _ in
                    card.content.shape.view(fillerColor: card.content.filler == .solid ? card.content.color : Color.white)
                        .frame(width: 40, height: 40)
                        .aspectRatio(1, contentMode: .fit)
                }
            }
            .padding(5)
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}



