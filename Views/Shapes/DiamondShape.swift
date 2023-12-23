import SwiftUI

struct DiamondShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.width / 2
        let height = rect.height / 2
        let center = CGPoint(x: rect.midX, y: rect.midY)

        path.move(to: CGPoint(x: center.x, y: center.y - height))
        path.addLine(to: CGPoint(x: center.x - width, y: center.y))
        path.addLine(to: CGPoint(x: center.x, y: center.y + height))
        path.addLine(to: CGPoint(x: center.x + width, y: center.y))
        path.closeSubpath()

        return path
    }

    func view(fillerColor: Color) -> some View {
        ZStack {
            self.fill(fillerColor) // Fill the shape
            self.stroke(Color.black, lineWidth: 3) // Apply the black border
        }
    }
}

struct DiamondShape_Previews: PreviewProvider {
    static var previews: some View {
        DiamondShape().view(fillerColor: .blue)
            .frame(width: 90, height: 90)
    }
}
