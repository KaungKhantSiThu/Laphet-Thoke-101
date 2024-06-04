//
//  LaphetRenderer.swift
//
//
//  Created by Kaung Khant Si Thu on 19/02/2024.
//

import SwiftUI

struct LaphetRenderer: View {
    static private var thumbnails = [Laphet.ID: Image]()

    var laphet: Laphet
    
    public init(laphet: Laphet) {
        self.laphet = laphet
    }

    @State private var imageIsReady = false
    @Environment(\.displayScale) private var displayScale

    public var body: some View {
        ZStack {
            if imageIsReady {
                Self.thumbnails[laphet.id]!
                    .resizable()
                    .interpolation(.medium)
                    .antialiased(true)
                    .scaledToFit()
            } else {
                ProgressView()
                    .controlSize(.small)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .onAppear {
            imageIsReady = Self.thumbnails.keys.contains(laphet.id)
            guard !imageIsReady else {
                return
            }
            let renderer = ImageRenderer(content: LaphetView(laphet: laphet))
            renderer.proposedSize = ProposedViewSize(width: 400, height: 400)
            renderer.scale = displayScale
            if let cgImage = renderer.cgImage {
                let image = Image(cgImage, scale: displayScale, label: Text(laphet.name))
                Self.thumbnails[laphet.id] = image
                imageIsReady = true
            }
        }
    }
}

#Preview {
    LaphetRenderer(laphet: .mandalayThote)
}
