import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = SetGameViewModel()

    var body: some View {
        Text("hello world")
            }
        }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
