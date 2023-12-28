import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: SetGameViewModel

    // Define the grid layout for three columns
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.cards.indices, id: \.self) { index in
                    CardView(viewModel: viewModel, cardIndex: index)
                        .aspectRatio(2/3, contentMode: .fit)
                }
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
