import SwiftUI

struct SwipeIndicator: View {
    #if targetEnvironment(macCatalyst)
    private let iconName = "cursorarrow"
    private let text = "Drag card Left or Right"
    #elseif os(iOS)
    private let iconName = "hand.draw.fill"
    private let text = "Swipe card Left or Right"
    #endif
    var body: some View {
        Label(text, systemImage: iconName)
            .padding()
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20.0))
    }
}

#Preview {
    SwipeIndicator()
        .font(.system(size: 30))
//        .scaleEffect(4.0)
}

