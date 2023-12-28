import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SetGameViewModel

    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(0..<viewModel.visibleCardCount, id: \.self) { index in
                    if index < viewModel.cards.count && !viewModel.cards[index].isMatched {
                        CardView(viewModel: viewModel, cardIndex: index)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .padding()
            .animation(.easeInOut(duration: 0.3), value: viewModel.cards)

            // Button to show more cards
            Button("Show More Cards") {
                viewModel.showMoreCards()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: SetGameViewModel())
    }
}
