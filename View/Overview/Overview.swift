import SwiftUI

struct Overview: View {
    @State private var showTip = true
    @State private var selection: Info.ID = 1
    
    private let slides = Info.all
    var body: some View {
        SlideDeck(selection: $selection, slides: slides)
            .overlay(alignment: .top, content: { 
                if showTip {
                    SwipeIndicator()
                        .padding(.top)
                }
                
                if selection == slides.count {
                    CompletionIndicator()
                }
            })
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.showTip = false
            }
        }
    }
}

#Preview {
    Overview()
}
