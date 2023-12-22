import SwiftUI

struct CardView: View {
    var card: CardContent

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white) // Default background color
                .frame(width: 100, height: 200)
                .border(Color.gray, width: 1)

            VStack {
                ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                    card.shape.view()
                        .foregroundColor(card.color)  // Directly using SwiftUI Color
                        .frame(width: 50, height: 100)
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = CardContent(color: .blue, shape: .oval, numberOfShapes: 1)
        CardView(card: card)
    }
}

// Extension to convert CardColor enum to SwiftUI Color
