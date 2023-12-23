import SwiftUI

struct CardContent: Hashable {
    var color: Color
    var shape: CardShape
    var numberOfShapes: Int
    var filler : filler
}

enum filler: Hashable { case solid, unfilled }

enum CardShape: Hashable {
    case diamond, oval, squiggle

    @ViewBuilder
    func view(fillerColor: Color) -> some View {
        switch self {
        case .diamond:
            DiamondShape().view(fillerColor: fillerColor)
        case .oval:
            OvalShape().view(fillerColor: fillerColor)
        case .squiggle:
            SquiggleShape().view(fillerColor: fillerColor)
        }
    }
}

