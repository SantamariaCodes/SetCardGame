import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            DiamondShape()
                .foregroundColor(.red)

                .frame(width: 100, height: 100)
            

            DiamondShape()
                .stroke(Color.blue, lineWidth: 2)
                .frame(width: 100, height: 100)
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
