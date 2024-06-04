import SwiftUI

struct ContentView: View {
    @Environment(LaphetModel.self) var model: LaphetModel
    
    @State private var selection: Panel? = Panel.overview
    @State private var path = NavigationPath()

    var body: some View {
        NavigationSplitView {
            Sidebar(selection: $selection)
        } detail: {
            NavigationStack(path: $path) {
                DetailColumn(selection: $selection, model: model)
            }
        }
        .onChange(of: selection) { _, _ in
            path.removeLast(path.count)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    struct Preview: View {
        @State private var model = LaphetModel.preview
        var body: some View {
            ContentView()
                .environment(model)
        }
    }
    static var previews: some View {
        Preview()
    }
}
