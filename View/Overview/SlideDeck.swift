//
//  SlideDeck.swift
//
//
//  Created by Kaung Khant Si Thu on 13/02/2024.
//

import SwiftUI

struct SlideDeck: View {

    
    @Binding var selection: Info.ID
    
    let slides: [Info]
    
    var totalPages: Int {
        return slides.count
    }
    
    var body: some View {
        VStack {
            PageView(selection: $selection) {
                ForEach(slides) { slide in
                    FlashCard(info: slide)
                        .cardStyle(cornerRadius: 25)
                        .aspectRatio(0.8, contentMode: .fit)
                        .padding()
                        .frame(width: 500)
                        .focusable()
                        
                }
            }
            .pageViewStyle(.cardDeck)
            .scaleEffect(0.9)
            .pageViewCardCornerRadius(45.0)
            .pageViewCardShadow(.visible)
            
            PageIndicator(
                selection: indicatorSelection,
                total: totalPages
            ) { (_, selected) in
                if selected {
                    Image(systemName: "leaf.fill")
                }
            }
            .pageIndicatorColor(.secondary.opacity(0.3))
            .pageIndicatorCurrentColor(.accentColor)
        }
    }
    
    var indicatorSelection: Binding<Int> {
        .init {
            return selection - 1
        } set: { newValue in
            selection = newValue + 1
        }
    }
    
}

//struct SlideDeck_Previews: PreviewProvider {
//    static var previews: some View {
//        SlideDeck()
//    }
//}
