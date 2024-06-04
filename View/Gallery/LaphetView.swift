//
//  LaphetView.swift
//
//
//  Created by Kaung Khant Si Thu on 17/02/2024.
//

import SwiftUI
let laphetThumbnailSize: Double = 128

struct LaphetView: View {
    var laphet: Laphet
    var visibleLayers: LaphetLayer = .all
    
    init(laphet: Laphet, visibleLayers: LaphetLayer = .all) {
        self.laphet = laphet
        self.visibleLayers = visibleLayers
    }
    
    var body: some View {
        GeometryReader { proxy in
            let useThumbnail = min(proxy.size.width, proxy.size.height) <= laphetThumbnailSize
            ZStack {
                Image("plate")
                    .resizable()
                    .interpolation(.medium)
                    .scaledToFit()
                    .id(laphet.id)
                if visibleLayers.contains(.base) {
                    laphet.base.image(thumbnail: useThumbnail)
                        .resizable()
                        .interpolation(.medium)
                        .scaledToFit()
                        .id(laphet.base.id)
                }
                
                if visibleLayers.contains(.body) {
                    ForEach(laphet.body) {
                        $0.image(thumbnail: useThumbnail)
                            .resizable()
                            .interpolation(.medium)
                            .scaledToFit()
                            .id($0.id)
                    }
                }
                
                if visibleLayers.contains(.garnish) {
                    ForEach(laphet.garnish) {
                        $0.image(thumbnail: useThumbnail)
                            .resizable()
                            .interpolation(.medium)
                            .scaledToFit()
                            .id($0.id)
                    }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .compositingGroup()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

public struct LaphetLayer: OptionSet {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let base = LaphetLayer(rawValue: 1 << 1)
    public static let body = LaphetLayer(rawValue: 1 << 2)
    public static let garnish = LaphetLayer(rawValue: 1 << 3)
    public static let dressing = LaphetLayer(rawValue: 1 << 4)

    public static let all: LaphetLayer = [base, body, garnish, dressing]
}

#Preview {
    LaphetView(laphet: .cornLaphet)
}
