//
//  LaphetGalleryGrid.swift
//
//
//  Created by Kaung Khant Si Thu on 15/02/2024.
//

import SwiftUI

struct LaphetGalleryGrid: View {
    var laphets: [Laphet]
    var width: Double
#if os(iOS)
    @Environment(\.horizontalSizeClass) private var sizeClass
#endif
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    var useReducedThumbnailSize: Bool {
#if os(iOS)
        if sizeClass == .compact {
            return true
        }
#endif
        if dynamicTypeSize >= .xxxLarge {
            return true
        }
        
#if os(iOS)
        if width <= 390 {
            return true
        }
#elseif os(macOS)
        if width <= 520 {
            return true
        }
#endif
        
        return false
    }
    
    var cellSize: Double {
        useReducedThumbnailSize ? 100 : 150
    }
    
    var thumbnailSize: Double {
#if os(iOS)
        return useReducedThumbnailSize ? 60 : 100
#else
        return useReducedThumbnailSize ? 40 : 80
#endif
    }
    
    var gridItems: [GridItem] {
        [GridItem(.adaptive(minimum: cellSize), spacing: 20, alignment: .top)]
    }
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 20) {
            ForEach(laphets) { laphet in
                NavigationLink(value: laphet.id) {
                    VStack {
                        LaphetView(laphet: laphet)
                            .frame(width: thumbnailSize, height: thumbnailSize)

                        VStack(spacing: 5) {
                            let flavor = laphet.flavors.mostPotentFlavor
                            Text(laphet.name)
                                .lineLimit(1)
                            TagView(flavor: flavor)
                            /*
                            HStack(spacing: 4) {
                                Text(flavor.symbol)
                                Text(flavor.name)
                            }
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                                                   */
                        }
                        .multilineTextAlignment(.center)
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}

struct LaphetGalleryGrid_Previews: PreviewProvider {
    struct Preview: View {
        @State private var laphets = Laphet.all
        
        var body: some View {
            GeometryReader { proxy in
                ScrollView {
                    LaphetGalleryGrid(laphets: laphets, width: proxy.size.width)
                }
            }
        }
    }
    
    static var previews: some View {
        Preview()
    }
}

