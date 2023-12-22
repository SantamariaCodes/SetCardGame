import SwiftUI

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let size = min(rect.width, rect.height) / 2 // Ensuring the diamond fits in the view

        path.move(to: CGPoint(x: center.x, y: center.y - size))
        path.addLine(to: CGPoint(x: center.x - size, y: center.y))
        path.addLine(to: CGPoint(x: center.x, y: center.y + size))
        path.addLine(to: CGPoint(x: center.x + size, y: center.y))
        path.closeSubpath()

        return path
    }
}

struct DiamondShape_Previews: PreviewProvider {
    static var previews: some View {
        DiamondShape()
            .frame(width: 100, height: 100)
    }
}
