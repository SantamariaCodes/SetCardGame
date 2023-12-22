import SwiftUI

struct OvalShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path(ellipseIn: rect)
    }
}

struct OvalShape_Previews: PreviewProvider {
    static var previews: some View {
        OvalShape()
            .frame(width: 100, height: 50)
            .previewLayout(.sizeThatFits)
    }
}
