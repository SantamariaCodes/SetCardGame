import SwiftUI

@main
struct SetCardGameApp: App {
    let viewModel = SetGameViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
