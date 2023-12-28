import SwiftUI

protocol CardContentProtocol {
    var color: Color { get }
    var shape: CardShape { get }
    var numberOfShapes: Int { get }
    var filler: filler { get }
}

// Modify the existing CardContent struct to conform to CardContentProtocol
struct CardContent: Hashable, CardContentProtocol {
    var color: Color
    var shape: CardShape
    var numberOfShapes: Int
    var filler: filler
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
