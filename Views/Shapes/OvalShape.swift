import SwiftUI

struct OvalShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path(ellipseIn: rect)
    }

    func view(fillerColor: Color) -> some View {
        ZStack {
            self.fill(fillerColor)
            self.stroke(Color.black, lineWidth: 3)
        }
    }
}

struct OvalShape_Previews: PreviewProvider {
    static var previews: some View {
        OvalShape().view(fillerColor: .red)
            .frame(width: 90, height: 90)
    }
}
