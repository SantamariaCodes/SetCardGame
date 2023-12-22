import SwiftUI

struct CardContent: Hashable {
    var color: Color
    var shape: CardShape
    var numberOfShapes: Int
}

enum CardShape: Hashable {
    case diamond, oval, squiggle

    @ViewBuilder
    func view() -> some View {
        switch self {
        case .diamond:
            DiamondShape()
        case .oval:
            OvalShape()
        case .squiggle:
            SquiggleShape()
        }
    }
}
