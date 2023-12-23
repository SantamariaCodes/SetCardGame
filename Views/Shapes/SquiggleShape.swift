import SwiftUI

struct SquiggleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Starting point
        path.move(to: CGPoint(x: rect.minX, y: rect.midY))
        
        // Curve to the right
        path.addCurve(to: CGPoint(x: rect.maxX, y: rect.midY),
                      control1: CGPoint(x: rect.minX + rect.width * 1/3, y: rect.minY),
                      control2: CGPoint(x: rect.minX + rect.width * 2/3, y: rect.maxY))
        
        // Curve back to the left
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.midY),
                      control1: CGPoint(x: rect.minX + rect.width * 2/3, y: rect.minY),
                      control2: CGPoint(x: rect.minX + rect.width * 1/3, y: rect.maxY))

        return path
    }

    func view(fillerColor: Color) -> some View {
        ZStack {
            self.fill(fillerColor)
            self.stroke(Color.black, lineWidth: 3)
        }
    }
}

struct SquiggleShape_Previews: PreviewProvider {
    static var previews: some View {
        SquiggleShape()
            .view(fillerColor: .blue)
            .frame(width: 100, height: 50)
            .previewLayout(.sizeThatFits)
    }
}
