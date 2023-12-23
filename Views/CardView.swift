import SwiftUI

struct CardView: View {
    var card: CardContent
    @State private var isSelected = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 100, height: 150)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isSelected ? Color.blue : Color.gray, lineWidth: isSelected ? 3 : 1)
                )
                .onTapGesture {
                    isSelected.toggle()
                }

            VStack(spacing: 10) {
                ForEach(0..<card.numberOfShapes, id: \.self) { _ in
                    card.shape.view(fillerColor: card.filler == .solid ? card.color : Color.white)
                        .frame(width: 40, height: 40)
                        .aspectRatio(1, contentMode: .fit)
                }
            }
            .padding(5)
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let card = CardContent(color: .red, shape: .squiggle, numberOfShapes: 1, filler: .unfilled)
        CardView(card: card)
    }
}
