import SwiftUI

@main
struct MyApp: App {
    @State private var model = LaphetModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
#if os(macOS)
        .defaultSize(width: 1000, height: 650)
#endif
    }
}
