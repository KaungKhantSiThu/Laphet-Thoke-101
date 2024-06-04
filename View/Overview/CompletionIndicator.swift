import SwiftUI

struct CompletionIndicator: View {
    private let iconName = "hands.and.sparkles.fill"
    private let text = "Knowledge acquired!"
    var body: some View {
        Label(text, systemImage: iconName)
            .symbolRenderingMode(.palette)
            .foregroundStyle(.primary, .tint)
            .padding()
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 20.0))
    }
}

#Preview {
    CompletionIndicator()
        .font(.system(size: 30))
    //        .scaleEffect(4.0)
}



